//
//  propertyList.h
//  JibenetApplication
//
//  Created by Raj on 02/09/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
@class propertyList;

@protocol propertyListDelegate <NSObject>

-(void)showList:(propertyList *)propertyDelegate witheResponse:(NSDictionary *)dicResponse;

@end

@interface propertyList : NSObject<NSURLConnectionDelegate>
{
    id<propertyListDelegate>propertyListDataDelegate;
}
@property (nonatomic,retain) id<propertyListDelegate>propertyListDataDelegate;
-(void)accessPropertyList;
@end
