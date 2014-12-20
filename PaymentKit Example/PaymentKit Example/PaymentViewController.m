//
//  ViewController.m
//  PTKPayment Example
//
//  Created by Alex MacCaw on 1/21/13.
//  Copyright (c) 2013 Stripe. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController()

@property IBOutlet PTKView* paymentView;

@end


#pragma mark -

@implementation PaymentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    self.title = @"Change Card";
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    saveButton.enabled = NO;
    self.navigationItem.rightBarButtonItem = saveButton;
    
    self.paymentView = [[PTKView alloc] initWithFrame:CGRectMake(15, 25, 250, 45)];
    self.paymentView.delegate = self;
    
    [self.view addSubview:self.paymentView];
    
    UIButton *fillButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 80, 290, 50)];
    [fillButton.layer setCornerRadius:3.f];
    [fillButton.layer setBorderColor:[[UIColor colorWithWhite:0.2 alpha:0.2f] CGColor]];
    [fillButton.layer setBorderWidth:1.f];
    [fillButton setBackgroundColor:[UIColor whiteColor]];
    [fillButton setTitleColor:[UIColor colorWithWhite:0.2 alpha:1.f] forState:UIControlStateNormal];
    [fillButton setTitle:@"Fill Card Number Field" forState:UIControlStateNormal];
    [fillButton addTarget:self action:@selector(fill) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fillButton];
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 140, 290, 50)];
    [clearButton.layer setCornerRadius:3.f];
    [clearButton.layer setBorderColor:[[UIColor colorWithWhite:0.2 alpha:0.2f] CGColor]];
    [clearButton.layer setBorderWidth:1.f];
    [clearButton setBackgroundColor:[UIColor whiteColor]];
    [clearButton setTitleColor:[UIColor colorWithWhite:0.2 alpha:1.f] forState:UIControlStateNormal];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
    
    UIButton *resizeButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 200, 290, 50)];
    [resizeButton.layer setCornerRadius:3.f];
    [resizeButton.layer setBorderColor:[[UIColor colorWithWhite:0.2 alpha:0.2f] CGColor]];
    [resizeButton.layer setBorderWidth:1.f];
    [resizeButton setBackgroundColor:[UIColor whiteColor]];
    [resizeButton setTitleColor:[UIColor colorWithWhite:0.2 alpha:1.f] forState:UIControlStateNormal];
    [resizeButton setTitle:@"Shrink" forState:UIControlStateNormal];
    [resizeButton addTarget:self action:@selector(resize) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resizeButton];
}

- (void)fill
{
    [self.paymentView setTextFieldCardNumber:@"4111111111111111"];
}

- (void)clear
{
    [self.paymentView clearFields];
}

- (void)resize
{
    [self.paymentView setFrame:CGRectMake(self.paymentView.frame.origin.x, self.paymentView.frame.origin.y,
                                          self.paymentView.frame.size.width, 35)];
}

- (void)paymentViewDidTapScanCard:(PTKView *)paymentView
{
    NSLog(@"tapped scan card");
}

- (void) paymentView:(PTKView *)paymentView withCard:(PTKCard *)card isValid:(BOOL)valid
{
    self.navigationItem.rightBarButtonItem.enabled = valid;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    PTKCard* card = self.paymentView.card;
    
    NSLog(@"Card last4: %@", card.last4);
    NSLog(@"Card expiry: %lu/%lu", (unsigned long)card.expMonth, (unsigned long)card.expYear);
    NSLog(@"Card cvc: %@", card.cvc);
    
    [[NSUserDefaults standardUserDefaults] setValue:card.last4 forKey:@"card.last4"];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
