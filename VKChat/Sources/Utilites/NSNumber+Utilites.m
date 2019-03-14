//
//  NSNumber+Utilites.m
//
//  Created by Sergey Lenkov on 06.11.10.
//  Copyright 2010 Positive Team. All rights reserved.
//

#import "NSNumber+Utilites.h"

@implementation NSNumber (Utilites)

- (NSString *)moneyFormat {
    NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
	
	[formatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
	[formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	[formatter setPositiveFormat:[NSString stringWithFormat:@"#,##0.00"]];
    
    return [formatter stringFromNumber:self];
}

- (NSString *)byteFormat {
    unsigned long long size = [self longLongValue];
    
    if (size < 999) {
        return [NSString stringWithFormat:@"%.2llu KB", size];
    }
    
    if (size < 999999999) {
        return [NSString stringWithFormat:@"%.2f MB", size / 1048576.0];
    }
    
    if (size < 999999999999) {
        return [NSString stringWithFormat:@"%.2f GB", size / 1073741824.0];
    }
    
    return [NSString stringWithFormat:@"%.2f TB", size / 1099511627776.0];
}

- (NSString *)bitFormat {
    unsigned long long size = [self longLongValue];
    
    if (size < 999) {
        return [NSString stringWithFormat:@"%.2llu Kbps", size];
    }
    
    if (size < 999999999) {
        return [NSString stringWithFormat:@"%.2f Mbps", size / 1000000.0];
    }
    
    if (size < 999999999999) {
        return [NSString stringWithFormat:@"%.2f Gbps", size / 1000000000.0];
    }
    
    return [NSString stringWithFormat:@"%.2f Tbps", size / 1000000000000.0];
}

- (NSString *)durationFormatWithHours {
    int totalSeconds = [self intValue];
    
    int hours = totalSeconds / 3600;
    int minutes = (totalSeconds - (hours * 3600)) / 60;
    int seconds = totalSeconds - ((hours * 3600) + (minutes * 60));
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}

- (NSString *)durationFormatWithMinutes {
    int totalSeconds = [self intValue];
    
    int minutes = totalSeconds / 60;
    int seconds = totalSeconds % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}

@end
