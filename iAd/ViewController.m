//
//  ViewController.m
//  iAd
//
//  Created by Marian PAUL on 27/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    _adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    _adView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait, ADBannerContentSizeIdentifierLandscape, nil];
    
    _adView.delegate = self;
    _adView.alpha = 0.0;
    
    _adView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    // placement de la publicité en bas de la vue
    CGRect newFrame = _adView.frame;
    newFrame.origin.y = CGRectGetHeight(self.view.frame) - CGRectGetHeight(_adView.frame);
    _adView.frame = newFrame;
    
    [self.view addSubview:_adView];
}


#pragma mark - ADBannerView delegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if(!_adBannerIsVisible) // si la pub n'est pas déjà affichée
    {
        [UIView animateWithDuration:0.3
                         animations:^{
                             _adView.alpha = 1.0; 
                         }];
        _adBannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if(_adBannerIsVisible) // si la pub n'est pas déjà affichée
    {
        [UIView animateWithDuration:0.3
                         animations:^{
                             _adView.alpha = 0.0; 
                         }];
        _adBannerIsVisible = NO;
    }  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
        _adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    else
        _adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
}

@end
