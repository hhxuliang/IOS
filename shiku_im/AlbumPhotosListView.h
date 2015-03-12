//
//  AlbumPhotosListView.h
//  SimpleCollectionViewAPI
//
//  Created by Simple Shi on 7/18/14.
//  Copyright (c) 2014 Microthink Inc,. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AssetsLibrary/ALAsset.h>
#import <AssetsLibrary/ALAssetsGroup.h>
#import <AssetsLibrary/ALAssetRepresentation.h>
#import "JXChatViewController.h"

@interface AlbumPhotosListView : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *selectImages;
@property (nonatomic, strong) NSMutableArray *selectImages_path;
@property (nonatomic, strong) UITableView *maintableview;
@property (nonatomic, strong) ALAssetsGroup *assetGroup;
@property (nonatomic, strong) JXChatViewController* col;
@end
