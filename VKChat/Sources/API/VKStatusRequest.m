//
//  VKStatusRequest.m
//  VKMessages
//
//  Created by Sergey Lenkov on 11.05.12.
//  Copyright (c) 2012 Sergey Lenkov. All rights reserved.
//

#import "VKStatusRequest.h"

@implementation VKStatusRequest

@synthesize userID;

- (void)dealloc {
    [_resultBlock release];
    [super dealloc];
}

- (void)startWithResultBlock:(VKStatusRequestResultBlock)aResultBlock failureBlock:(VKRequestFailureBlock)aFailureBlock {
    _resultBlock = [aResultBlock copy];
    _failureBlock = [aFailureBlock copy];
        
    _method = @"status.get";
        
    [self addParamWithKey:@"uid" value:[NSString stringWithFormat:@"%ld", self.userID]];
        
    [self start];
}
    
- (void)parseResponse {
    [super parseResponse];
        
    if (!_error) {
        VKStatus *status = [[[VKStatus alloc] initWithDictionary:[_response objectForKey:@"response"]] autorelease];
        
        if (_resultBlock) {
            _resultBlock(status);
        }
    }
}

@end
