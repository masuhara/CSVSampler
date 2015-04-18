//
//  ViewController.m
//  CSVTableView
//
//  Created by Master on 2015/04/18.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController {
    IBOutlet UITableView *table;
    NSMutableArray *brandArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    table.dataSource = self;
    table.delegate = self;
    
    NSString *csvFile = [[NSBundle mainBundle] pathForResource:@"brand" ofType:@"csv"];
    NSData *csvData = [NSData dataWithContentsOfFile:csvFile];
    NSString *csv = [[NSString alloc] initWithData:csvData encoding:NSUTF8StringEncoding];

    NSArray *lines = [csv componentsSeparatedByString:@"\n"];
    if (!brandArray) {
        brandArray = [NSMutableArray new];
    }
    for (NSString *row in lines) {
        [brandArray addObject:row];
    }
    
    [table reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return brandArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = brandArray[indexPath.row];
    
    return cell;
}










@end
