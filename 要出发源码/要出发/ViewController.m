//
//  ViewController.m
//  要出发
//
//  Created by tarena002 on 16/8/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "yxdADandMeunViewModel.h"
@interface ViewController ()
@property (nonatomic) yxdADandMeunViewModel *ADandMeunVM;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [yxdNetManger getADandMeunListCompletionHandler:^(yxdADandMeumModel *model, NSError *error) {
//        NSLog(@"11111");
//    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (yxdADandMeunViewModel *)ADandMeunVM {
	if(_ADandMeunVM == nil) {
		_ADandMeunVM = [[yxdADandMeunViewModel alloc] init];
	}
	return _ADandMeunVM;
}

@end
