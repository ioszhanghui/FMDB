//
//  ViewController.m
//  FMDB
//
//  Created by 小飞鸟 on 2018/1/18.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import "ViewController.h"
#import "FMDBManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)openSqlite:(id)sender {
    [[FMDBManager shareManager]createFMDB];;
}
- (IBAction)createtable:(id)sender {
    [[FMDBManager shareManager]createTable];;
}
- (IBAction)addData:(id)sender {
    
    [[FMDBManager shareManager]insertIntoData];;
}
- (IBAction)updateData:(id)sender {
    [[FMDBManager shareManager]updateData];;
}
- (IBAction)selectData:(id)sender {
    [[FMDBManager shareManager]selectData];;
}
- (IBAction)deleteData:(id)sender {
    [[FMDBManager shareManager]deleteData];;
}
- (IBAction)closeSqlite:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
