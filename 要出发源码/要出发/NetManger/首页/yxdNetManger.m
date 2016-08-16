//
//  yxdNetManger.m
//  要出发
//
//  Created by tarena002 on 16/8/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "yxdNetManger.h"

@implementation yxdNetManger
+ (id)getADandMeunListCompletionHandler:(void (^)(yxdADandMeumModel *, NSError *))conpletionHandler
{
    return [self GET:kADandMeumPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !conpletionHandler ?: conpletionHandler([yxdADandMeumModel parse:responseObj],error);
    }];
}
@end
