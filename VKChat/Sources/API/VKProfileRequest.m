//
//  VKUserProfileRequest.m
//  VKMessages
//
//  Created by Sergey Lenkov on 11.05.12.
//  Copyright (c) 2012 Sergey Lenkov. All rights reserved.
//

#import "VKProfileRequest.h"

@implementation VKProfileRequest

@synthesize userID;

- (void)dealloc {
    [_resultBlock release];
    [super dealloc];
}

- (void)startWithResultBlock:(VKProfileRequestResultBlock)aResultBlock failureBlock:(VKRequestFailureBlock)aFailureBlock {
    _resultBlock = [aResultBlock copy];
    _failureBlock = [aFailureBlock copy];
    
    _method = @"users.get";
    
    [self addParamWithKey:@"uids" value:[NSString stringWithFormat:@"%ld", self.userID]];
    [self addParamWithKey:@"fields" value:@"uid,first_name,last_name,nickname,screen_name,sex,bdate,city,country,photo,photo_medium,photo_big,photo_rec,has_mobile,contacts,education,online,last_seen,exports,connections"];
    
    [self start];
}

- (void)parseResponse {
    [super parseResponse];
    
    if (!_error) {
        VKProfile *profile = [[[VKProfile alloc] initWithDictionary:[[_response objectForKey:@"response"] objectAtIndex:0] loadPhoto:NO] autorelease];

        if (_resultBlock) {
            _resultBlock(profile);
        }
    }
}

@end
