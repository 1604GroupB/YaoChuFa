//
//  ADandMeumModel.h
//  要出发
//
//  Created by tarena002 on 16/8/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>




@class yxdADandMeumContentModel,yxdADandMeumContentAdModel;
@interface yxdADandMeumModel : NSObject

@property (nonatomic, strong) NSArray<yxdADandMeumContentModel *> *content;

@property (nonatomic, assign) NSInteger code;

@end

@interface yxdADandMeumContentModel : NSObject

@property (nonatomic, strong) NSArray<yxdADandMeumContentAdModel *> *ad;

@property (nonatomic, copy) NSString *operateId;

@property (nonatomic, copy) NSString *titleAlias;

@end

@interface yxdADandMeumContentAdModel : NSObject
//new_app_picpath-->picpathappnew
@property (nonatomic, copy) NSString *picpathappnew;

@property (nonatomic, assign) NSInteger adId;

@property (nonatomic, copy) NSString *app_picpath;

@property (nonatomic, copy) NSString *app_url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *appToUrl;

@property (nonatomic, assign) NSInteger app_url_site;

@end

