//
//  MovesViewController.m
//  friendly
//
//  Created by Daniel Christopher on 5/31/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

#import "MovesViewController.h"
#import "RKSwipeBetweenViewControllers.h"

@interface MovesViewController ()

@end

@implementation MovesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPageViewController *pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    RKSwipeBetweenViewControllers *navigationController = [[RKSwipeBetweenViewControllers alloc]initWithRootViewController:pageController];
    
    UIViewController *v1 = [[UIViewController alloc] init];
    v1.title = @"hello";
    v1.view.backgroundColor = [UIColor greenColor];
    [v1.view setFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    
    [navigationController.viewControllerArray addObjectsFromArray:@[v1]];
    
    [self addChildViewController:navigationController];
    [navigationController.view setFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:navigationController.view];
    [navigationController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
