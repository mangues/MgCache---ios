//
//  ViewController.m
//  Cachedemo
//
//  Created by mangues on 15/12/25.
//  Copyright © 2015年 mangues. All rights reserved.
//

#import "ViewController.h"
#import "FileManager.h"
#import "MgCache.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MgCache *mCache = [MgCache getMgCache];
    MgCache *mCache2 = [MgCache getMgCache:@"dd"];

    
    //[mCache putValue:@"123" forKey:@"121212" saveTime:5];
   // [mCache2 putValue:@"123aaa" forKey:@"eeeeeee" saveTime:5];

    
    NSString *value = [mCache getAsString:@"121212"];
     NSString *value2 = [mCache2 getAsString:@"eeeeeee"];
    
    [_label setText:value2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
