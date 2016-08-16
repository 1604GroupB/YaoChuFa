//
//  yxdADandMeunViewModel.m
//  要出发
//
//  Created by tarena002 on 16/8/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "yxdADandMeunViewModel.h"

@implementation yxdADandMeunViewModel
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler
{
    [yxdNetManger getADandMeunListCompletionHandler:^(yxdADandMeumModel *model, NSError *error)
     {
        [model.content enumerateObjectsUsingBlock:^(yxdADandMeumContentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([[obj valueForKey:@"titleAlias"]isEqualToString:@"bannerScroll"])
            {
                [self.ADdataList addObjectsFromArray:[obj valueForKey:@"ad"]];
            }
            if ([[obj valueForKey:@"titleAlias"] isEqualToString:@"bannerRound"])
            {
                [self.MeundataList addObjectsFromArray:[obj valueForKey:@"ad"]];
            }
        }];
         !completionHandler ?: completionHandler(error);
    }];
   
}

#pragma 广告
- (NSInteger )numOfAD
{
    return self.ADdataList.count;
}

- (NSURL *)ADiconForRow:(NSInteger)row
{
    return self.ADdataList[row].app_picpath.yx_URL;
}

- (NSMutableArray<yxdADandMeumContentAdModel *> *)ADdataList {
    if(_ADdataList == nil) {
        _ADdataList = [[NSMutableArray<yxdADandMeumContentAdModel *> alloc] init];
    }
    return _ADdataList;
}


#pragma 菜单
- (NSURL *)MeuniconForRow:(NSInteger)row
{
    return self.MeundataList[row].app_picpath.yx_URL;
}
- (NSString *)MeunTitleForRow:(NSInteger)row
{
    return self.MeundataList[row].title;
}
- (NSMutableArray <yxdADandMeumContentAdModel *> *)MeundataList {
    if(_MeundataList == nil) {
        _MeundataList = [[NSMutableArray <yxdADandMeumContentAdModel *> alloc] init];
    }
    return _MeundataList;
}
@end
