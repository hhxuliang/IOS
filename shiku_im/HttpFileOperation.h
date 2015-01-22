//
//  UploadFile.h
//  shiku_im
//
//  Created by xuliang on 15-1-18.
//  Copyright (c) 2015年 Reese. All rights reserved.
//

#ifndef shiku_im_UploadFile_h
#define shiku_im_UploadFile_h
#import <UIKit/UIKit.h>
#import "JXChatViewController.h"
@interface HttpFileOperation :NSObject{
   
}
+(void) postFileByPath:(NSString*)fullpath;
+(void) postFileByImage:(UIImage*)img col:(JXChatViewController*)col path:(NSString*)path;
+(UIImage *) getImageFromURL:(NSString *)fileURL ;
+(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath ;
@end

#endif
