//
//  ViewController.m
//  UIKit
//
//  Created by ywl on 16/5/10.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[
                   @"NSAttributeStringVC",
                   @"NSDataAssetVC",
                   @"NSLayoutAnchorVC",
                   @"UIUserNotificationSettingsVC",
                   @"UITextInputVC",
                   @"UITextInputTraitsVC",
                   @"UITableViewVC",
                   @"UIScrollViewVC",
                   @"UIViewVC",
                   @"UIResponderVC",
                   @"UITextViewVC",
                   @"NSTextStorageVC",
                   @"NSLayoutManagerVC",
                   @"NSTextContainerVC",
                   @"UIControlVC",
                   @"UIEventVC",
                   @"UITouchVC",
                   @"UITextFieldVC",
                   @"UIGestureRecognizerVC",
                   @"UITapGestureRecognizerVC",
                   @"UIWindowVC"
                   @"UITableViewControllerVC",
                   @"UIWebViewVC",
                   @"UIViewControllerVC"
                   ];

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[NSClassFromString(self.array[indexPath.row]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
