//
//  PTKCardImage.m
//  PaymentKit Example
//
//  Created by Yukan Liao on 2014-12-29.
//  Copyright (c) 2014 Stripe. All rights reserved.
//

#import "PTKCardImage.h"

@implementation PTKCardImage

+ (UIImage*)imageForCardType:(PTKCardType)type
{
    NSString *cardTypeName = @"placeholder";
    
    switch (type) {
        case PTKCardTypeAmex:
            cardTypeName = @"amex";
            break;
        case PTKCardTypeDinersClub:
            cardTypeName = @"diners";
            break;
        case PTKCardTypeDiscover:
            cardTypeName = @"discover";
            break;
        case PTKCardTypeJCB:
            cardTypeName = @"jcb";
            break;
        case PTKCardTypeMasterCard:
            cardTypeName = @"mastercard";
            break;
        case PTKCardTypeVisa:
            cardTypeName = @"visa";
            break;
        default:
            break;
    }
    
    return [UIImage imageNamed:cardTypeName];
}

@end
