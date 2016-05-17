//
//  UITableViewVC.m
//  UIKit
//
//  Created by ywl on 16/5/11.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITableViewVC.h"

@interface UITableViewVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSUInteger rowCount;
@end

@implementation UITableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rowCount = 20;
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    //行高
    tableView.rowHeight = 70;
    // 头部section高度
    tableView.sectionHeaderHeight = 35;
    // 底部section高度
    tableView.sectionFooterHeight = 35;
    // 自动行高估计时估计的行高
//    tableView.estimatedRowHeight = 70;
    // 自动Section高度估计的高度
//    tableView.estimatedSectionHeaderHeight = 35;
//    tableView.estimatedSectionFooterHeight = 35;
    // 分割线
    tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    UIView *cyan = [[UIView alloc] init];
    cyan.backgroundColor = [UIColor cyanColor];
    tableView.backgroundView = cyan;
    self.tableView = tableView;
    // 刷新数据
//    [tableView reloadData];
    // 刷新分组
//    reloadSectionIndexTitles
    // 有多少组
    NSLog(@"%ld", (long)[tableView numberOfSections]);
    // section的frame
//    [tableView rectForSection:0];
    // sectionHeader的frame
//    [tableView rectForHeaderInSection:0];
    // sectionFooter的frame
//    [tableView rectForFooterInSection:0];
    // Row的frame
//    [tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    // 根据给定点得出indexpath
//    [tableView indexPathForRowAtPoint:CGPointMake(0, 100)];
    // 根据cell得出indexpath
//    [tableView indexPathForCell:nil];
    // 根据Rect返回indexpath数组
//    [tableView indexPathsForRowsInRect:CGRectMake(0, 0, 100, 300)];
    // 根据indexpath 返回Cell
//    [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    // 可见的cells
    NSLog(@"%@", [tableView visibleCells]);
    NSLog(@"%@", [tableView indexPathsForVisibleRows]);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UITableViewHeaderFooterView *view = [tableView headerViewForSection:0];
    NSLog(@"%@", view);
    // footerView
//    [tableView footerViewForSection:0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(test)];
}

- (void)test
{
    // 滚动到具体某行
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    // 滚动到选中的行
//    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
    // 插入组
//    public func insertSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation)
    // 删除组
//    public func deleteSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation)
    // 刷新组
//    public func reloadSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation)
   // 移动组
//    public func moveSection(section: Int, toSection newSection: Int)
//    [UIView animateKeyframesWithDuration:6 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
//        // 插入行
//        //    public func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation)
//        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3 animations:^{
//            self.rowCount += 1;
//            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//        }];
//        // 删除行
//        //    public func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation)
//        [UIView addKeyframeWithRelativeStartTime:1/3 relativeDuration:1/3 animations:^{
//            self.rowCount -= 1;
//            [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//        }];
//        // 刷新行
//        //    public func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation)
//        // 移动行
//        //    public func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath)
//        [UIView addKeyframeWithRelativeStartTime:2/3 relativeDuration:1/3 animations:^{
////            [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//            [self.tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] toIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
//        }];
//    } completion:^(BOOL finished) {
//        
//    }];
    // 进入编辑状态
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    // 禁止选中
    self.tableView.allowsSelection = NO;
    // 是否允许编辑状态被选中
    self.tableView.allowsSelectionDuringEditing = YES;
    // 是否允许多选
    self.tableView.allowsMultipleSelection = YES;
    // 是否允许编辑状态多选
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    
    // 选中某行
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    // 选中的行
    NSLog(@"%@", [self.tableView indexPathForSelectedRow]);
    // 选中的多行
    NSLog(@"%@", [self.tableView indexPathsForSelectedRows]);
    // 取消选中某行
//    deselectRowAtIndexPath
    self.tableView.sectionIndexMinimumDisplayRowCount = 3;
    self.tableView.sectionIndexColor = [UIColor redColor];
    self.tableView.sectionIndexBackgroundColor = [UIColor cyanColor];
    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor greenColor];
    // 分割线颜色
//    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.separatorEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    // 表头
//    tableHeaderView
    // 表尾
//    tableFooterView
    
    // 普通复用
//    public func dequeueReusableCellWithIdentifier(identifier: String) -> UITableViewCell? // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.
    // 从storeboard 里加载时分行复用
//    public func dequeueReusableCellWithIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath) -> UITableViewCell // newer dequeue method guarantees a cell is returned and resized properly, assuming identifier is registered
    // 复用header 或 footer
//    public func dequeueReusableHeaderFooterViewWithIdentifier(identifier: String) -> UITableViewHeaderFooterView?
    
   // 注册cell的复用, nib加载
//    public func registerNib(nib: UINib?, forCellReuseIdentifier identifier: String)
    // 从class 复用
//    public func registerClass(cellClass: AnyClass?, forCellReuseIdentifier identifier: String)
    
    // nib 复用footer或header
//    public func registerNib(nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String)
    // class 复用footer或header
//    public func registerClass(aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseId = @"reuseId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
//        cell.contentView.backgroundColor = [UIColor clearColor];
//        cell.backgroundColor = [UIColor clearColor];
        NSLog(@"%u", arc4random_uniform(255));
        cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    }
    return cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"a",@"b", @"c"];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"title";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"footer";
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row != 2;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// 索引点击事件
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}

// 编辑事件调用
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

// 移动行结束后调用
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{

}

#pragma mark --- UITableViewDelegate
// 将要显示cell
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.25 animations:^{
        cell.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
//        cell.contentView.backgroundColor = previous;
    }];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{

}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{

}

// cell显示完成
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{

}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
}

// 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}

// 估算的高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    return 30;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 30;
}

// header OR footer
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

// 辅助按钮点击
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击辅助按钮");
}

// 高亮情况
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{

}

// 编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

// 删除按钮文本
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"去掉";
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    
    action1.backgroundColor = [UIColor cyanColor];
    
    
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    
    action2.backgroundColor = [UIColor whiteColor];
    action2.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UITableViewRowAction *aciton3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"默认" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    
    aciton3.backgroundColor = [UIColor greenColor];
    
    return @[action1, action2, aciton3];
    
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 编辑
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{

}

// 是否可移动到此位置
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

// 缩排
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Action
- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    return YES;
}

- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    
}

@end









































