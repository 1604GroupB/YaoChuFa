//
//  yxdNetManger.h
//  要出发
//
//  Created by tarena002 on 16/8/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetworking.h"
#import "yxdADandMeumModel.h"
@interface yxdNetManger : BaseNetworking
+ (id)getADandMeunListCompletionHandler:(void(^)(yxdADandMeumModel *model,NSError *error))conpletionHandler;
@end
