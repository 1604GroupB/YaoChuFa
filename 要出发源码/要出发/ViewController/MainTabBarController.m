//
//  MainTabBarController.m
//  要出发
//
//  Created by tarena002 on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MainTabBarController.h"
#import "yxdIndexViewController.h"
@interface MainTabBarController ()
@property (nonatomic) yxdIndexViewController *indexVC;
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = @[self.indexVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 控制器懒加载
- (yxdIndexViewController *)indexVC {
    if(_indexVC == nil) {
        _indexVC = [[yxdIndexViewController alloc] initWithStyle:UITableViewStylePlain];
        _indexVC.tabBarItem.image = [UIImage imageNamed:@"around_hot_icon_16x19_"];
    }
    return _indexVC;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
