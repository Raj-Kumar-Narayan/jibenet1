//
//  AppDelegate.h
//  JibenetApplication
//
//  Created by Raj on 12/08/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JibenetViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JibenetViewController *viewController;

@property (strong,nonatomic) UINavigationController *navController;

@end
