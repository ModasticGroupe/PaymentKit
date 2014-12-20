//
//  ScanCardView.m
//  PaymentKit Example
//
//  Created by Yukan Liao on 2014-12-19.
//  Copyright (c) 2014 Stripe. All rights reserved.
//

#import "ScanCardView.h"

@implementation ScanCardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDisplay];
    }
    return self;
}

- (void)setupDisplay
{
    self.scanButtonView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card-scan.png"]];
    [self.scanButtonView setBackgroundColor:[UIColor clearColor]];
    [self.scanButtonView setContentMode:UIViewContentModeScaleAspectFit];
    [self.scanButtonView setUserInteractionEnabled:YES];
    [self.scanButtonView setFrame:CGRectMake(self.frame.size.width - 45, 8, 26, 26)];
    [self.scanButtonView setCenter:CGPointMake(self.scanButtonView.center.x, self.frame.size.height * 0.5)];
    [self addSubview:self.scanButtonView];

    self.scanLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 12)];
    [self.scanLabel setBackgroundColor:[UIColor clearColor]];
    [self.scanLabel setTextColor:[UIColor colorWithWhite:0.2 alpha:1.f]];
    [self.scanLabel setFont:[UIFont boldSystemFontOfSize:9]];
    [self.scanLabel setText:@"Scan"];
    [self.scanLabel sizeToFit];
    [self addSubview:self.scanLabel];
}

- (void)layoutSubviews
{
    [self.scanButtonView setFrame:CGRectMake(self.frame.size.width - self.frame.size.height,
                                             0, self.frame.size.height * 0.58,
                                             self.frame.size.height * 0.58)];
    [self.scanButtonView setCenter:CGPointMake(self.scanButtonView.center.x, self.frame.size.height * 0.5 - 4)];
    [self.scanLabel setCenter:CGPointMake(self.scanButtonView.center.x,
                                          self.frame.size.height * 0.5 + self.scanButtonView.frame.size.height * 0.5 - 1)];
}

@end
