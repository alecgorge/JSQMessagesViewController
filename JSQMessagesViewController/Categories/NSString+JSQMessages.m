//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "NSString+JSQMessages.h"

@implementation NSAttributedString (JSQMessages)

- (NSAttributedString *)jsq_attributedStringByTrimingWhitespace {
    return [self jsq_attributedStringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSAttributedString *)jsq_attributedStringByTrimmingCharactersInSet:(NSCharacterSet *)set {
    NSCharacterSet *invertedSet = set.invertedSet;
    NSString *string = self.string;
    unsigned int loc, len;
    
    NSRange range = [string rangeOfCharacterFromSet:invertedSet];
    loc = (range.length > 0) ? (int)range.location : 0;
    
    range = [string rangeOfCharacterFromSet:invertedSet options:NSBackwardsSearch];
    len = (range.length > 0) ? (int)NSMaxRange(range) - loc : (int)string.length - loc;
    
    return [self attributedSubstringFromRange:NSMakeRange(loc, len)];
}

@end

@implementation NSString (JSQMessages)

- (NSString *)jsq_stringByTrimingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
