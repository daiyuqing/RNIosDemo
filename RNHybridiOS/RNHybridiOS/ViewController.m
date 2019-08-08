//
//  ViewController.m
//  RNHybridiOS
//
//  Created by 前端组 on 2019/8/1.
//  Copyright © 2019 前端组. All rights reserved.
//

#import "ViewController.h"
#import "RNPageController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    // Do any additional setup after loading the view.
}

- (IBAction)onClick:(id)sender {
    RNPageController *next = [[self storyboard]
      instantiateViewControllerWithIdentifier:@"RNPage"];
    [self presentViewController:next animated:true completion:nil];
}



@end
