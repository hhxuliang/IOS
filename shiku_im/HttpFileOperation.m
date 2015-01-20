//
//  UploadFile.m
//  shiku_im
//
//  Created by xuliang on 15-1-18.
//  Copyright (c) 2015年 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpFileOperation.h"
#import "JXChatViewController.h"
#define UPLOAD_URL @"http://192.168.8.1:8080/Server/UploadFile"//上传地址
@implementation HttpFileOperation

+(void) postFileByImage:(UIImage*)img col:(JXChatViewController*)col path:(NSString*)path{
    // Do something usefull in here instead of sleeping ...
    NSURL *URL = [NSURL URLWithString:UPLOAD_URL];
    ASIFormDataRequest *Request = [ASIFormDataRequest requestWithURL:URL];
    [Request setRequestMethod:@"POST"];
    [Request addRequestHeader:@"Content-Type" value:@"application/json"];
    [Request addRequestHeader:@"ExtName" value:@".png"];
    [Request setTimeOutSeconds:60];
    
    //[Request setPostValue:auth forKey:@"auth"];
    //UIImage *img = [self scaleToSize:[info objectForKey:@"UIImagePickerControllerOriginalImage"] size:CGSizeMake(300,300)];
    [Request setData:UIImagePNGRepresentation(img) forKey:@"file"];
    
    [Request setDelegate:self];
    [Request setCompletionBlock:^{
        NSString *responseString = [Request responseString];
        //NSLog(@"Response: %@", responseString);
        [col sendImagePath:responseString path:path];
    }];
    [Request setFailedBlock:^{
        NSError *error = [Request error];
        NSLog(@"Error: %@,%@", error.localizedDescription,Request.url);
    }];
    [Request startSynchronous];
    
}
+(void)postFileByPath:(NSString*)fullPath{
    // Do something usefull in here instead of sleeping ...
    NSURL *URL = [NSURL URLWithString:UPLOAD_URL];
    ASIFormDataRequest *Request = [ASIFormDataRequest requestWithURL:URL];
    [Request setRequestMethod:@"POST"];
    [Request addRequestHeader:@"Content-Type"value:@"application/json"];
    [Request setTimeOutSeconds:60];
    
    //[Request setPostValue:auth forKey:@"auth"];
    //UIImage *img = [self scaleToSize:[info objectForKey:@"UIImagePickerControllerOriginalImage"] size:CGSizeMake(300,300)];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:fullPath];
    [Request setData:UIImagePNGRepresentation(img) forKey:@"file"];
    
    [Request setDelegate:self];
    [Request setCompletionBlock:^{
        NSString *responseString = [Request responseString];
        //NSLog(@"Response: %@", responseString);
        NSDictionary *info = [responseString JSONValue];
        NSNumber *status = [info objectForKey:@"status"];
        if([status intValue]==1){
            
            
        }else if([status intValue]==-1){
            
        }else{
            
        }
    }];
    [Request setFailedBlock:^{
        NSError *error = [Request error];
        NSLog(@"Error: %@,%@", error.localizedDescription,Request.url);
    }];
    [Request startSynchronous];
}

+(UIImage *) getImageFromURL:(NSString *)fileURL {
    NSLog(@"执行图片下载函数");
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}


+(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:imageName] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:imageName] options:NSAtomicWrite error:nil];
    } else {
        //ALog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
        NSLog(@"文件后缀不认识");
    }
}


+(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    
    return result;
}
@end