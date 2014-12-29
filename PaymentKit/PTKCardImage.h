//
//  PTKCardImage.h
//  PaymentKit Example
//
//  Created by Yukan Liao on 2014-12-29.
//  Copyright (c) 2014 Stripe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTKCardType.h"

@interface PTKCardImage : NSObject

+ (UIImage*)imageForCardType:(PTKCardType)type;

@end
