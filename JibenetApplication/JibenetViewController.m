//
//  AppDelegate.h
//  JibenetApplication
//
//  Created by Raj on 12/08/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import "JibenetViewController.h"
#import "JibenetCustomCell.h"
#import "RMEIdeasPullDownControl.h"
#import <MessageUI/MessageUI.h>
#import "descriptionView.h"

#import "LRSlidingTableViewCell.h"
#import "propertyList.h"

#define kLastSelected @"klastselected"
#define kPlaceName @"arrName"
#define kPlaceAddress @"arrAddress"
#define kPlaceSize @"arrSize"
#define kPlacePrice @"arrRate"
#define kPlaceImage @"dataImage"

typedef enum
{
    AtoZ = 0,
    ZtoA,
    HighestToLowest,
    LowestToHighest,
    OldestToNewest,
    NewestToOldest
}
TableSortSortCriteria;

@interface JibenetViewController ()<RMEIdeasPullDownControlDataSource, RMEIdeasPullDownControlProtocol,MFMailComposeViewControllerDelegate,propertyListDelegate>
{
      
}
@property (weak, nonatomic) IBOutlet UITableView *exampleTableView;
@property (strong, nonatomic) RMEIdeasPullDownControl *rmeideasPullDownControl;
@property (strong, nonatomic) NSArray *sortTitlesArray;
@property (strong, nonatomic) NSArray *tableDataArray;
@property (strong, nonatomic) NSArray *mutableTableDataArray;


@end

@implementation JibenetViewController
@synthesize currentlyActiveSlidingCell;
@synthesize swipeDirectionSegmentedControl;
@synthesize swipeDirection;
//define labels globally.
UILabel *lblName,*lblAddress ,*lblPostDate, *lblSize,*lblRate;
UIView *menu;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"List Of Property";
    self.navigationItem.prompt = @"Use the toolbar to change swipe --> direction";
    
    UIBarButtonItem *controlItem = [[UIBarButtonItem alloc] initWithCustomView:self.swipeDirectionSegmentedControl];
    [self setToolbarItems:[NSArray arrayWithObject:controlItem]];
	//create button for sliding direction options.
    UIBarButtonItem *segmentControl = [[UIBarButtonItem alloc]initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(ClickedMenu)];
//    segmentControl.frame = CGRectMake(10, 3, 40, 40);
//    segmentControl.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
//    [segmentControl addTarget:self action:@selector(handleSegmentedControlSelection:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem =segmentControl;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self createTableData];
    
    //Create an array of titles to display as different functions are selected by the user.
    self.sortTitlesArray = @[@"Listed from A - Z", @"Listed from Z - A", @"Brand value: HIGHEST - LOWEST", @"Brand value: LOWEST - HIGHEST", @"Founded: OLDEST - NEWEST", @"Founded: NEWEST - OLDEST"];
    
    //Initializing RMEIdeasPullDownControl property using the designated initializer.  
    self.rmeideasPullDownControl = [[RMEIdeasPullDownControl alloc] initWithDataSource:self
                                                                              delegate:self
                                                                      clientScrollView:self.exampleTableView];
    CGRect originalFrame = self.rmeideasPullDownControl.frame;
    self.rmeideasPullDownControl.frame = CGRectMake(0.0, 45.0, originalFrame.size.width, originalFrame.size.height);
    
    //It is recommended that the control is placed behind the client scrollView. Remember to make its background transparent.
    [self.view insertSubview:self.rmeideasPullDownControl belowSubview:self.exampleTableView];
    
    [self.exampleTableView registerNib:[UINib nibWithNibName:@"RMECustomCell" bundle:nil]
                forCellReuseIdentifier:@"RMECustomCell"];
    propertyList *pl =[[propertyList alloc]init];
    [pl setPropertyListDataDelegate:self];
    [pl accessPropertyList];
}
-(void)showList:(propertyList *)propertyDelegate witheResponse:(NSDictionary *)dicResponse
{
   
    NSLog(@"The Response is: %@",dicResponse);
   // NSDictionary *dicParse = [dicResponse objectForKey:@"name"];
    arrName = [dicResponse valueForKey:@"name"];
      NSLog(@"Property Name: %@",arrName);
 arrAddr = [dicResponse valueForKey:@"address"];
    NSLog(@"Property Address: %@",arrAddr);
   arrSize = [dicResponse valueForKey:@"size"];
    NSLog(@"Property Size: %@",arrSize);
arrRate = [dicResponse valueForKey:@"rate"];
    NSLog(@"Property Rate: %@",arrRate);
dataImage = [dicResponse valueForKey:@"image"];
    NSLog(@"Property Image: %@",dataImage);
    
}

- (IBAction)handleSegmentedControlSelection:(UISegmentedControl *)sender;
{
    self.swipeDirection = (LRSlidingTableViewCellSwipeDirection)sender.selectedSegmentIndex;
    self.currentlyActiveSlidingCell = nil;
    [self.exampleTableView reloadData];
}
-(void)ClickedMenu
{
    if(!isClicked)
    {
    menu =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 80)];
    menu.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"menuIcon.png"]];
//        UIButton *segmntcntrl =[UIButton buttonWithType:UIButtonTypeCustom];
//        segmntcntrl.frame =CGRectMake(5, 2, 20 , 10);
//        segmntcntrl.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
//        [segmntcntrl addTarget:self action:@selector(info) forControlEvents:UIControlEventTouchUpInside];
//        [menu addSubview:segmntcntrl];

    [self.view addSubview:menu];
        isClicked =YES;
//        return NO;
    }
    else{
        [menu removeFromSuperview];
        isClicked =NO;
    }
   
}

-(void)Facebook
{
    mySLComposerSheet =[[SLComposeViewController alloc]init];
    mySLComposerSheet =[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [mySLComposerSheet setInitialText:@"The Jibenet application is owesome experience it at http://www.jibenet.com"];
    [self presentViewController:mySLComposerSheet animated:YES completion:NULL];

}
-(void)twitter
{
    mySLComposerSheet1 =[[SLComposeViewController alloc]init];
    mySLComposerSheet1 =[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [mySLComposerSheet1 setInitialText:@"The Jibenet application is owesome experience it at http://www.jibenet.com"];
    [self presentViewController:mySLComposerSheet1 animated:YES completion:NULL];
}
-(void)info
{
    descriptionView *detail = [[descriptionView alloc]initWithNibName:@"descriptionView" bundle:nil];
    [self.navigationController pushViewController:detail animated:YES];

}

- (void)openMail
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@""];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"", @"", nil];
        [mailer setToRecipients:toRecipients];
        UIImage *myImage = [UIImage imageNamed:@""];
        NSData *imageData = UIImagePNGRepresentation(myImage);
        [mailer addAttachmentData:imageData mimeType:@"" fileName:@""];
        NSString *emailBody = @"";
        [mailer setMessageBody:emailBody isHTML:NO];
        [self presentViewController:mailer animated:YES completion:nil];
      
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
      
    }
    
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
     
     }

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Tell the control what selection to make. In this case we use NSUserDefaults to save and retrieve last selection made.
    [self.rmeideasPullDownControl selectControlAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:kLastSelected]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) createTableData
{
    self.tableDataArray = @[@{arrName: @"name", arrAddr: @"address", arrRate: @"rate", dataImage: @"image", arrSize:@"size"}];

}
#pragma mark - Tableview datasource and delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    propertyList *pl =[[propertyList alloc]init];
    [pl setPropertyListDataDelegate:self];
    [pl accessPropertyList];
    
    JibenetCustomCell *cell = [self.exampleTableView dequeueReusableCellWithIdentifier:@"JibenetCustomCell"];
    cell.lblName.text = [[self.tableDataArray objectAtIndex:[indexPath row]] objectForKey:@"name"];
    
    NSString *address = [[self.tableDataArray objectAtIndex:[indexPath row]] objectForKey:@"address"];
    cell.lblAddress.text = [NSString stringWithFormat:@"sdd%@", address];
    
    NSString *rate = [[self.tableDataArray objectAtIndex:[indexPath row]] objectForKey:@"rate"];
    cell.lblRate.text = [NSString stringWithFormat:@"ws%@", rate];
   
    NSString *size = [[self.tableDataArray objectAtIndex:[indexPath row]] objectForKey:@"size"];
    cell.lblSize.text = [NSString stringWithFormat:@"%@", size];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mutableTableDataArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - RMEIdeasePullDownControl DataSource and Delegate methods
- (void) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
          selectedControlAtIndex:(NSUInteger)controlIndex
{
    NSSortDescriptor *sortDescriptor = nil;
    NSArray *sortDescriptors = nil;
    switch (controlIndex)
    {
        case AtoZ:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kPlaceName ascending:YES];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case ZtoA:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kPlaceName ascending:NO];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case HighestToLowest:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kPlaceSize ascending:NO];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case LowestToHighest:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kPlaceSize ascending:YES];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case OldestToNewest:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kPlacePrice ascending:YES];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case NewestToOldest:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kPlacePrice ascending:NO];
            sortDescriptors = @[sortDescriptor];
            break;
            
        default:
            break;
    }
    self.mutableTableDataArray = [self.tableDataArray sortedArrayUsingDescriptors:sortDescriptors];
    [self.exampleTableView reloadData];
    
}

- (NSUInteger) numberOfButtonsRequired:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
{
    return 6;
}

- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl imageForControlAtIndex:(NSUInteger)controlIndex
{
    UIImage *image0 = [UIImage imageNamed:@"SortAZ.png"];
    UIImage *image1 = [UIImage imageNamed:@"SortZA.png"];
    UIImage *image2 = [UIImage imageNamed:@"HighLow.png"];
    UIImage *image3 = [UIImage imageNamed:@"LowHigh.png"];
    UIImage *image4 = [UIImage imageNamed:@"OldNew.png"];
    UIImage *image5 = [UIImage imageNamed:@"NewOld.png"];
    
    NSArray *imagesArray = @[image0, image1, image2, image3, image4, image5];
    return imagesArray[controlIndex];
}

- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
      selectedImageForControlAtIndex:(NSUInteger)controlIndex
{
    UIImage *image0 = [UIImage imageNamed:@"SortAZSelected.png"];
    UIImage *image1 = [UIImage imageNamed:@"SortZASelected.png"];
    UIImage *image2 = [UIImage imageNamed:@"HighLowSelected.png"];
    UIImage *image3 = [UIImage imageNamed:@"LowHighSelected.png"];
    UIImage *image4 = [UIImage imageNamed:@"OldNewSelected.png"];
    UIImage *image5 = [UIImage imageNamed:@"NewOldSelected.png"];
    
    NSArray *imagesArray = @[image0, image1, image2, image3, image4, image5];
    return imagesArray[controlIndex];
}

- (NSString*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
               titleForControlAtIndex:(NSUInteger)controlIndex
{
    return self.sortTitlesArray[controlIndex];
}


@end
