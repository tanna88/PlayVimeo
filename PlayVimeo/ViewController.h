//
//  ViewController.h
//  PlayVimeo
//
//  Created by Tan Nguyen on 1/30/13.
//  Copyright (c) 2013 East Agile. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IOS_OLDER_THAN_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] < 6.0 )
#define IOS_NEWER_OR_EQUAL_TO_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] >= 6.0 )

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtUrl;
@end
