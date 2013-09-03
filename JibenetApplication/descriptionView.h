//
//  descriptionView.h
//  JibenetApplication
//
//  Created by Raj on 12/08/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface descriptionView : UIViewController<UIScrollViewDelegate>
@property (nonatomic,retain) UITextView *txtContent;
@property (nonatomic,retain) UIScrollView *scrollView;
@property (nonatomic,retain) UIImageView *largeImage;
@end
