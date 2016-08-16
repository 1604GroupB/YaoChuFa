//
//  ADandMeumModel.m
//  要出发
//
//  Created by tarena002 on 16/8/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "yxdADandMeumModel.h"

@implementation yxdADandMeumModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"content":[yxdADandMeumContentModel class]};
}
@end


@implementation yxdADandMeumContentModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"ad":[yxdADandMeumContentAdModel class]};
}

@end


@implementation yxdADandMeumContentAdModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"picpathappnew":@"new_app_picpath",@"picpathappnew":@"ct.picpathappnew",@"adId":@"ct.adId",@"app_picpath":@"ct.app_picpath",@"app_url":@"ct.app_url",@"title":@"ct.title",@"appToUrl":@"ct.appToUrl",@"app_url_site":@"ct.app_url_site"};
}

@end




