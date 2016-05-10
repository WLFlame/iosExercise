//
//  UIUserNotificationSettingsVC.m
//  UIKit
//
//  Created by ywl on 16/5/10.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIUserNotificationSettingsVC.h"

@interface UIUserNotificationSettingsVC ()

@end

@implementation UIUserNotificationSettingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.view.backgroundColor = [UIColor whiteColor];
   // 设置推送现实类型
    UIUserNotificationType notificaitonType = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    // 设置推送样式
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    // 设置推送动作Action
    UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc] init];
    // 推送操作动作
    action.behavior = UIUserNotificationActionBehaviorTextInput;
    // 推送参数
    action.parameters = @{ UIUserNotificationTextInputActionButtonTitleKey : @"customize title"};
    // 推送启用状态
    action.activationMode = UIUserNotificationActivationModeBackground;
    // 推送是否在锁屏的时候收到
    action.authenticationRequired = NO;
    // 是否显示摧毁样式
    action.destructive = YES;
    
    NSArray *actions = @[action];
//    UIUserNotificationActionContextDefault 默认 UIUserNotificationActionContextMin the context of a notification action when space is limited
    [category setActions:actions forContext:UIUserNotificationActionContextDefault];
    NSSet *set = [NSSet setWithArray:@[category]];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:notificaitonType categories:set];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
     [[UIApplication sharedApplication] registerForRemoteNotifications];
}




@end
