//
//  NSDate_AFDateExtension.h
//  AFDateHelperObjC
//
//  Created by Jeremy Broutin on 6/18/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (AFDateExtension)

typedef NS_ENUM(NSInteger, ISO8601Format) {
  Year,
  YearMonth,
  Date,
  DateTime,
  DateTimeSec,
  DateTimeMilliSec
};

typedef NS_ENUM(NSInteger, DateFormat) {
  ISO8601,
  DotNet,
  RSS,
  AltRSS,
  Custom
};

- (NSString*)ISO8601FormatTypeToString:(ISO8601Format)formatType;
- (NSString*)ISO8601FormatFromString:(NSString*)dateString;

#pragma mark Intervals in seconds
+ (double)minuteInSeconds;
+ (double)hourInSeconds;
+ (double)dayInSeconds;
+ (double)weekInSeconds;
+ (double)yearInSeconds;

#pragma mark Components
+ (NSCalendarUnit)componentFlags;

@end
