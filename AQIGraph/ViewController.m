//
//  ViewController.m
//  AQIGraph
//
//  Created by IOSUSER006 on 8/29/14.
//  Copyright (c) 2014 Dev-Touch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DTGraphView *graphView = [[DTGraphView alloc]initWithFrame:CGRectMake(15, 30, 290, 290)];
    [graphView setTotalContents:10];
    [self.view addSubview:graphView];
    
    DTGraphView *graphMini = [[DTGraphView alloc]initWithFrame:CGRectMake(15, 320, 150, 84)];
    [graphMini setTotalContents:3];
    [self.view addSubview:graphMini];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
