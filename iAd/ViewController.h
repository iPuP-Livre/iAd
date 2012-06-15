//
//  ViewController.h
//  iAd
//
//  Created by Marian PAUL on 27/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate> 
{
    ADBannerView *_adView;
    BOOL _adBannerIsVisible;
}
@end
