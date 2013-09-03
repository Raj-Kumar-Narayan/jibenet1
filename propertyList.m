//
//  propertyList.m
//  JibenetApplication
//
//  Created by Raj on 02/09/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import "propertyList.h"
#import "SBJSON.h"
@implementation propertyList
@synthesize propertyListDataDelegate;
-(void)accessPropertyList
{
    NSURL *theURL = [NSURL URLWithString:@"http://clipas.venturepact.com/WebService.aspx?key=pList&address=sas&type=Loja"];
    NSMutableURLRequest *req =[NSMutableURLRequest requestWithURL:theURL];
    [req setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"accept"];
    [req setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    NSError *error;
    NSURLResponse *theResponce = [[NSURLResponse alloc]init];
    NSData *theData = [NSURLConnection sendSynchronousRequest:req returningResponse:&theResponce error:&error];
    NSArray *arrResponse = [NSJSONSerialization JSONObjectWithData:theData options:0 error:&error];
    NSString *strResponse = [[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding];
    NSLog(@"The Response: %@",arrResponse);
    SBJSON *Json = [SBJSON new];
    NSDictionary *dicResponse = [Json objectWithString:strResponse];
    [propertyListDataDelegate showList:self witheResponse:dicResponse];
    NSLog(@"The Data is: %@",dicResponse);
}
@end
