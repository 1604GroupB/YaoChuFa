//
//  NSString+YX.m
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSString+YX.h"

@implementation NSString (YX)
- (NSURL *)yx_URL{
    //http://  https://
    if ([self containsString:@"http://"] || [self containsString:@"https://"]) {
        return [NSURL URLWithString:self];
    }
    return [NSURL fileURLWithPath:self];
}

- (NSURL *)yx_VideoURL{
    return [NSString stringWithFormat:@"http://hls.quanmin.tv/live/%@/playlist.m3u8", self].yx_URL;
}
@end
