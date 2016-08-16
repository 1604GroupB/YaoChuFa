//
//  NSString+YX.h
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YX)
/** 增加了逻辑判断, 对于文件路径 和 网络路径进行不同的处理  */
@property (nonatomic, readonly) NSURL *yx_URL;

//特殊: 根据uid获取对应的直播地址
@property (nonatomic, readonly) NSURL *yx_VideoURL;
@end
