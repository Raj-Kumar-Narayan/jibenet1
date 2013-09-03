//
//  AppDelegate.h
//  JibenetApplication
//
//  Created by Raj on 12/08/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import "descriptionView.h"

@interface descriptionView ()

@end

@implementation descriptionView
@synthesize txtContent,largeImage;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *bg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"d2.jpg"]];
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    if (screenRect.size.height==568.0f) {
        bg.image = [UIImage imageNamed:@"d2.jpg"];
    }
    bg.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:bg];
    [self.view sendSubviewToBack:bg];

    largeImage =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"d3.jpg"]];
    largeImage.frame = CGRectMake(30, 50, 250, 200);
    [self.view addSubview:largeImage];
    //implementing scrollView in the description part.

    txtContent= [[UITextView alloc]init];
    txtContent.frame =CGRectMake(40, 270, 230,200);
    txtContent.font= [UIFont fontWithName:@"Helvetica" size:12];
    txtContent.textColor = [UIColor blackColor];
    self.txtContent.editable = NO;
    self.txtContent.scrollEnabled =YES;
    self.scrollView.minimumZoomScale =1;
    self.scrollView.maximumZoomScale =7;
    txtContent.text =@"ehwfjhfgrufgfjgyw3wgrfhsgfyugwfhgyrugfhgyertfghsgyuwrgfhjgeyrtfhgfywtgfhgsfiytfhgiuewryfiywrfjhkfdhweufhdwvjdhghjehjvbjdfehwfjhfgrufgfjgyw3wgrfhsgfyugwfhgyrugfhgyertfghsgyuwrgfhjgeyrtfhgfywtgfhgsfiytfhgiuewryfiywrfjhkfdhweufhdwvjdhghjehjvbjdfehwfjhfgrufgfjgyw3wgrfhsgfyugwfhgyrugfhgyertfghsgyuwrgfhjgeyrtfhgfywtgfhgsfiytfhgiuewryfiywrfjhkfdhweufhdwvjdhghjehjvbjdfehwfjhfgrufgfjgyw3wgrfhsgfyugwfhgyrugfhgyertfghsgyuwrgfhjgeyrtfhgfywtgfhgsfiytfhgiuewryfiywrfjhkfdhweufhdwvjdhghjehjvbjdfehwfjhfgrufgfjgyw3wgrfhsgfyugwfhgyrugfhgyertfghsgyuwrgfhjgeyrtfhgfywtgfhgsfiytfhgiuewryfiywrfjhkfdhweufhdwvjdhghjehjvbjdfehwfjhfgrufgfjgyw3wgrfhsgfyugwfhgyrugfhgyertfghsgyuwrgfhjgeyrtfhgfywtgfhgsfiytfhgiuewryfiywrfjhkfdhweufhdwvjdhghjehjvbjdf";
    
    [self.view addSubview:txtContent];

      // Do any additional setup after loading the view from its nib.
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.txtContent;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
