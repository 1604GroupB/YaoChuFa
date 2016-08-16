//
//  yxdADandMeunViewModel.h
//  要出发
//
//  Created by tarena002 on 16/8/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "yxdNetManger.h"
@interface yxdADandMeunViewModel : BaseViewModel

//广告滚动
@property (nonatomic) NSInteger numOfAD;
- (NSURL*)ADiconForRow:(NSInteger)row;
@property (nonatomic) NSMutableArray<yxdADandMeumContentAdModel *> *ADdataList;

//菜单
- (NSURL*)MeuniconForRow:(NSInteger)row;
- (NSString*)MeunTitleForRow:(NSInteger)row;
@property (nonatomic) NSMutableArray <yxdADandMeumContentAdModel *> *MeundataList;




@end
