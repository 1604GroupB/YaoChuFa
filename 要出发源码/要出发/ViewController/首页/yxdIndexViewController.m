//
//  yxdIndexViewController.m
//  要出发
//
//  Created by tarena002 on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "yxdIndexViewController.h"
#import "yxdHeaderView.h"
#import "yxdADandMeunViewModel.h"
@interface yxdIndexViewController ()<yxdHeaderViewDelegate,yxdHeaderViewDataSource>
@property (nonatomic) yxdHeaderView *ADView;
@property (nonatomic) yxdADandMeunViewModel *ADVM;
@end

@implementation yxdIndexViewController
- (NSInteger)numberOfItemToScollor:(yxdHeaderView *)view
{
    return [self.ADVM numOfAD];
}

- (NSURL *)HeaderView:(yxdHeaderView *)view iconURLForIndex:(NSInteger)index
{
    return [self.ADVM ADiconForRow:index];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加广告滚动为表头视图
    self.tableView.tableHeaderView = self.ADView;
    
    __block typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.ADVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    
    
    
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (yxdHeaderView *)ADView {
	if(_ADView == nil) {
		_ADView = [[yxdHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
        _ADView.delegate = self;
        _ADView.dataSource = self;
        
	}
	return _ADView;
}

- (yxdADandMeunViewModel *)ADVM {
	if(_ADVM == nil) {
		_ADVM = [[yxdADandMeunViewModel alloc] init];
	}
	return _ADVM;
}

@end
