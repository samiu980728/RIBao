//
//  SecondMessageNavigationViewController.m
//  ribao
//
//  Created by 萨缪 on 2018/10/28.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "SecondMessageNavigationViewController.h"
#import "SecondaryMessageViewController.h"
@interface SecondMessageNavigationViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation SecondMessageNavigationViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    id target = self.interactivePopGestureRecognizer.delegate;
    
    //    创建滑动手势，并调用系统自带的滑动手势target的方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    //    设置手势代理
    pan.delegate = self;
    
    //    添加滑动手势
    [self.view addGestureRecognizer:pan];
    
    //    禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器

    if ( self.childViewControllers.count == 1 ){
        return NO;
    }
    
    // 当前页面是显示结果页，不响应滑动手势
    UIViewController *vc = [self.childViewControllers lastObject];
    if ([vc isKindOfClass:[SecondaryMessageViewController class]]) {
        return NO;
    }

    return YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
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
