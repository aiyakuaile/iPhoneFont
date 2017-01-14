//
//  FFTableViewController.m
//  iPhoneFont
//
//  Created by antvr on 2017/1/14.
//  Copyright © 2017年 sunTengFei_family. All rights reserved.
//

#import "FFTableViewController.h"
#import "FFTableViewCell.h"
@interface FFTableViewController ()
@property (nonatomic , strong)NSMutableArray *familyNameArray;

@end

@implementation FFTableViewController
-(NSMutableArray *)familyNameArray{

    if (!_familyNameArray) {
        _familyNameArray = [NSMutableArray array];
    }
    return _familyNameArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* familyNamesAll = [UIFont familyNames];
    
    for (NSString* family in familyNamesAll) {
        NSArray* fonts = [UIFont fontNamesForFamilyName:family];
        for (NSString* font in fonts)
        {
            NSLog(@"字体名称=====【 %@ 】",font);
            [self.familyNameArray addObject:font];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.familyNameArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"FFTableViewCell" owner:nil options:nil].lastObject;
    }
    NSString *fontString = self.familyNameArray[indexPath.section];
    cell.fontLabel.font = [UIFont fontWithName:fontString size:30];
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *fonstring = self.familyNameArray[section];
    NSString *titleString = [NSString stringWithFormat:@"字体名称【%@】",fonstring];
    return titleString;
}
@end
