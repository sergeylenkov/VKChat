//
//  VKDialogsRequest.m
//  VKMessages
//
//  Created by Sergey Lenkov on 13.05.12.
//  Copyright (c) 2012 Sergey Lenkov. All rights reserved.
//

#import "VKGetDialogsRequest.h"

@implementation VKGetDialogsRequest

@synthesize userID;
@synthesize chatID;
@synthesize offset;
@synthesize count;
@synthesize previewLength;

- (void)dealloc {
    [_resultBlock release];
    [super dealloc];
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.userID = -1;
        self.chatID = -1;
        self.offset = -1;
        self.count = -1;
    }
    
    return self;
}

- (void)startWithResultBlock:(VKGetDialogsRequestResultBlock)aResultBlock failureBlock:(VKRequestFailureBlock)aFailureBlock {
    _resultBlock = [aResultBlock copy];
    _failureBlock = [aFailureBlock copy];
    
    _method = @"messages.getDialogs";
    
    if (self.userID > 0) {
        [self addParamWithKey:@"uid" value:[NSString stringWithFormat:@"%ld", self.userID]];
    }
    
    if (self.chatID > 0) {
        [self addParamWithKey:@"chat_id" value:[NSString stringWithFormat:@"%ld", self.chatID]];
    }
    
    if (self.offset >= 0) {
        [self addParamWithKey:@"offset" value:[NSString stringWithFormat:@"%ld", self.offset]];
    }
    
    if (self.count > 0) {
        [self addParamWithKey:@"count" value:[NSString stringWithFormat:@"%ld", self.count]];
    }
    
    if (self.previewLength > 0) {
        [self addParamWithKey:@"preview_length" value:[NSString stringWithFormat:@"%ld", self.previewLength]];
    }
    
    [self start];
}

- (void)parseResponse {
    [super parseResponse];
    
    if (!_error) {
        NSMutableArray *dialogs = [[[NSMutableArray alloc] init] autorelease];
        
        if ([[_response objectForKey:@"response"] isKindOfClass:[NSArray class]]) {
            for (int i = 1; i < [[_response objectForKey:@"response"] count]; i++) {
                NSDictionary *dict = [[_response objectForKey:@"response"] objectAtIndex:i];
                VKDialog *dialog = [[VKDialog alloc] initWithDictionary:dict];
   
                [dialogs addObject:dialog];
                [dialog release];
            }
        }
        
        if (_resultBlock) {
            _resultBlock(dialogs);
        }
    }
}

@end
