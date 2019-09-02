//
//  SGViewController.m
//  SGBaseModule
//
//  Created by SG on 08/31/2019.
//  Copyright (c) 2019 SG. All rights reserved.
//

#import "SGTestViewController.h"
#import "SGBaseModule.h"
#import "SGMacorsConfig.h"

@interface SGTestViewController ()

@end

@implementation SGTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"SGTestViewController viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"SGTestViewController viewWillDisappear");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[[NSClassFromString(@"SGFirstViewController") alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
