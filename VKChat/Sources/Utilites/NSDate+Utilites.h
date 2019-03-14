//
//  NSDate+Utilites.h
//
//  Created by Sergey Lenkov on 06.11.10.
//  Copyright 2010 Sergey Lenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utilites)

- (NSDate *)truncate;
- (NSDate *)dateByAddingHours:(NSInteger)hours;
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (NSDate *)dateByAddingDays:(NSInteger)days;
- (NSDate *)dateByAddingMonths:(NSInteger)months;
- (NSInteger)daysCountBetweenDate:(NSDate *)date;
- (NSString *)dbDateFormat;
- (NSString *)shortDateRepresentation;
- (NSString *)mediumDateRepresentation;
- (NSString *)longDateRepresentation;
- (NSString *)longDateFormatWithTime;
- (NSString *)fullDateFormat;
- (NSString *)timeFormat;
- (NSString *)systemTimeRepresentation;
- (NSString *)shortMonthName;
- (NSString *)monthName;
- (NSString *)weekDayName;
- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)week;
- (NSInteger)weekday;
+ (NSDate *)dateFromDbString:(NSString *)db;
+ (NSDate *)dateFromRFC1123:(NSString *)rfc;
+ (NSDate *)dateFromTZ:(NSString *)tz;
+ (NSDate *)dateFromUTCString:(NSString *)utc;
- (NSString *)UTCString;
- (NSString *)UTCStringWithMilliseconds;
- (BOOL)isToday;

@end
