//
//  NSDate_AFDateExtension.m
//  AFDateHelperObjC
//
//  Created by Jeremy Broutin on 6/18/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate_AFDateExtension.h"

// DotNet: "/Date(1268123281843)/"
static NSString* const DefaultFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
static NSString* const RSSFormat = @"EEE, d MMM yyyy HH:mm:ss ZZZ"; // "Fri, 09 Sep 2011 15:26:08 +0200"
static NSString* const AltRSSFormat = @"d MMM yyyy HH:mm:ss ZZZ"; // "09 Sep 2011 15:26:08 +0200"

@implementation NSDate (AFDateExtension)

- (NSString*)ISO8601FormatTypeToString:(ISO8601Format)formatType {
  switch (formatType) {
    case Year: return @"yyyy";
    case YearMonth: return @"yyyy-MM";
    case Date: return @"yyyy-MM-dd";
    case DateTime: return @"yyyy-MM-dd'T'HH:mmZ";
    case DateTimeSec: return @"yyyy-MM-dd'T'HH:mm:ssZ";
    case DateTimeMilliSec: return @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    default:
      [NSException raise:NSGenericException format:@"Unexpected ISO8601 format type"];
      break;
  }
}
- (NSString*)ISO8601FormatFromString:(NSString*)dateString {
  switch (dateString.length) {
    case 4: return [self ISO8601FormatTypeToString:Year];
    case 7: return [self ISO8601FormatTypeToString:YearMonth];
    case 10: return [self ISO8601FormatTypeToString:Date];
    case 22: return [self ISO8601FormatTypeToString:DateTime];
    case 25: return [self ISO8601FormatTypeToString:DateTimeSec];
    default: return [self ISO8601FormatTypeToString:DateTimeMilliSec];
  }
}

@end
