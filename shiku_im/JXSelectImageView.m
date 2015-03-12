//
//  JXSelectImageView.m
//
//  Created by Reese on 13-8-22.
//  Copyright (c) 2013年 Reese. All rights reserved.
//

#import "JXSelectImageView.h"
#define CHAT_BUTTON_SIZE 70
#define INSETS 10


@implementation JXSelectImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //写死面板的高度
        [self setBackgroundColor:[UIColor whiteColor]];
        
        
        // Initialization code
        _photoButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [_photoButton setFrame:CGRectMake(INSETS, INSETS, CHAT_BUTTON_SIZE , CHAT_BUTTON_SIZE)];
        [_photoButton setImage:[UIImage imageNamed:@"sharemore_pic"] forState:UIControlStateNormal];
        [_photoButton addTarget:self action:@selector(pickPhoto) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_photoButton];
        
        _cameraButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setFrame:CGRectMake(INSETS +CHAT_BUTTON_SIZE, INSETS, CHAT_BUTTON_SIZE , CHAT_BUTTON_SIZE)];
        [_cameraButton setImage:[UIImage imageNamed:@"sharemore_video"] forState:UIControlStateNormal];
        [_cameraButton addTarget:self action:@selector(pickPhotoByCamera) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cameraButton];
        
    }
    return self;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)pickPhoto
{
    [_delegate pickPhoto];
}

-(void)pickPhotoByCamera
{
    [_delegate pickPhotoByCamera];
}
//-(UIImage *)imageDidFinishPicking
//{
//    
//}
//-(UIImage *)cameraDidFinishPicking
//{
//    
//}
//-(CLLocation *)locationDidFinishPicking
//{
//    
//}
-(void)dealloc
{
    [super dealloc];
    
}

@end
