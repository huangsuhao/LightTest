//
//  ViewController.m
//  LightTest
//
//  Created by Mario on 2017/9/25.
//  Copyright © 2017年 BearWow. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int dianyuan;
@property int numOfB2;
@property int numOfB3;
@property NSTimer* timer;
@property int repair;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _repair=1;
    _numOfB2 = 0;
    _numOfB3 = 0;
    _dianyuan = 0;
    NSLog(@"%d",_dianyuan);
    _L1.backgroundColor = [UIColor grayColor];
    _L2.backgroundColor = [UIColor grayColor];
    [self.B1 addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];
    [self.B2 addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];
    [self.B3 addTarget:self action:@selector(click3) forControlEvents:UIControlEventTouchUpInside];
    [self.B4 addTarget:self action:@selector(click4) forControlEvents:UIControlEventTouchUpInside];
    [self.L1Wrong addTarget:self action:@selector(clickWrong) forControlEvents:UIControlEventTouchUpInside];
    [self.L1Repair addTarget:self action:@selector(clickRepair) forControlEvents:UIControlEventTouchUpInside];
//    if ((_dianyuan = YES) && (_numOfB2 < _numOfB3)) {
//        _L1.backgroundColor = [UIColor yellowColor];
//        _L2.backgroundColor = [UIColor grayColor];
//    }
}


-(void)click1{
    _dianyuan = 1;
    NSLog(@"B2-%d",_numOfB2);
    NSLog(@"B3-%d",_numOfB3);
    NSLog(@"dianyuan-%d",_dianyuan);
}

-(void)click2{
    if (_dianyuan == 0) {
        NSLog(@"我的变呀我不变");
    }
    if (_dianyuan == 1&&_repair==1) {
        _numOfB2++;
        NSLog(@"B2-%d",_numOfB2);
        NSLog(@"B3-%d",_numOfB3);
        NSLog(@"dianyuan-%d",_dianyuan);
    }
    if ((_dianyuan == 1) && (_numOfB2 > _numOfB3)) {
        _L1.backgroundColor = [UIColor yellowColor];
        _L2.backgroundColor = [UIColor grayColor];
    }
    if ((_dianyuan == 1) && (_numOfB2 <= _numOfB3)) {
        _L1.backgroundColor = [UIColor grayColor];
        _L2.backgroundColor = [UIColor yellowColor];
    }
}

-(void)click3{
    if (_dianyuan == 0) {
        NSLog(@"我的变呀我不变");
    }
    if (_dianyuan == 1&&_repair==1) {
        _numOfB3++;
        NSLog(@"B2-%d",_numOfB2);
        NSLog(@"B3-%d",_numOfB3);
        NSLog(@"dianyuan-%d",_dianyuan);
    }
    if ((_dianyuan == 1) && (_numOfB2 > _numOfB3)) {
        _L1.backgroundColor = [UIColor yellowColor];
        _L2.backgroundColor = [UIColor grayColor];
    }
    if ((_dianyuan ==1) && (_numOfB2 <= _numOfB3)) {
        _L1.backgroundColor = [UIColor grayColor];
        _L2.backgroundColor = [UIColor yellowColor];
    }
}
-(void)click4{
    _L1.backgroundColor = [UIColor grayColor];
    _L2.backgroundColor = [UIColor grayColor];
    _dianyuan = 0;
    _numOfB2 = _numOfB3 = 0;
    NSLog(@"B2-%d",_numOfB2);
    NSLog(@"B3-%d",_numOfB3);
    NSLog(@"dianyuan-%d",_dianyuan);
}

-(void)clickWrong{
    _repair=0;
    _L1.backgroundColor = [UIColor grayColor];
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull _timer) {
        
        static NSInteger num = 0;
        
        NSLog(@"%ld", (long)num);
        num++;
        
        if (_dianyuan==1 && num%2 == 1 &&_repair==0) {
            _L2.backgroundColor = [UIColor yellowColor];
//            [_timer invalidate];
//            NSLog(@"end");
        }
        if (_dianyuan==1 && num%2 == 0&&_repair==0) {
            _L2.backgroundColor = [UIColor grayColor];
        }
        if (_repair==1) {
            [_timer invalidate];
            NSLog(@"end");
        }
    }];
    
    NSLog(@"start");
}

-(void)clickRepair{
    
    _repair=1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
