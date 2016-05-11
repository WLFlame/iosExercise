//
//  NSCalendarVC.m
//  Foundation
//
//  Created by ywl on 16/5/11.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "NSCalendarVC.h"

@interface NSCalendarVC ()

@end

@implementation NSCalendarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    picker.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
    picker.center = self.view.center;
    picker.minimumDate = [NSDate date];
    picker.minuteInterval = 30;
    picker.calendar.firstWeekday = 2;
    picker.calendar.minimumDaysInFirstWeek = 3;
    [self.view addSubview:picker];
    
    // 当前用户环境下的日历
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSLog(@"%@", currentCalendar);
    // 当前用户环境下的日历
    NSCalendar *autoCalendar = [NSCalendar autoupdatingCurrentCalendar];
    NSLog(@"%@", autoCalendar);
    // 地区
    NSLog(@"%@", [currentCalendar locale]);
    // 时区
    NSLog(@"%@", [currentCalendar timeZone]);
    
    NSLog(@"%lu", (unsigned long)currentCalendar.firstWeekday);
    
    NSLog(@"%lu", (unsigned long)currentCalendar.minimumDaysInFirstWeek);
    // 历法
    NSLog(@"%@", [currentCalendar eraSymbols]);
    //
    NSLog(@"%@", [currentCalendar longEraSymbols]);
    NSLog(@"%@", [currentCalendar monthSymbols]);
    NSLog(@"%@", [currentCalendar shortMonthSymbols]);
    NSLog(@"%@", [currentCalendar veryShortMonthSymbols]);
    NSLog(@"%@", [currentCalendar standaloneMonthSymbols]);
    NSLog(@"%@", [currentCalendar shortStandaloneMonthSymbols]);
    NSLog(@"%@", [currentCalendar quarterSymbols]);
}


@end
