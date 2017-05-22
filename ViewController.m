//
//  ViewController.m
//  Table View
//
//  Created by Detective Lawliet on 5/18/17.
//  Copyright © 2017 Detective Lawliet. All rights reserved.
//

/*
    You need to know how to delete, insert, and edit the tableview and familiarize youself with the tableview delegate method and data delegate method.

*/

#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController

NSArray *allNames;
NSArray *firstLetters;
NSDictionary *names;

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height - 20;
    
    names = @{@"A" : @[@"Alexandra Rugg", @"Alexis deMontford-Shepherd"],
              @"B" : @[@"Ben Newberg"],
              @"C" : @[@"Carla Ramazan", @"Catherine Lin"],
              @"E" : @[@"Elena Albregts", @"Eric Baggins"],
              @"F" : @[@"Fiona Lechene"],
              @"K" : @[@"Kati Steensrud", @"Katie Deeter", @"Kelly Zhang", @"Kelsey Jiang", @"Kristine Lu"],
              @"L" : @[@"Lauren Klein", @"Lillian Beeson"],
              @"O" : @[@"Olina Zhu", @"Olivia Sison", @"Omercan Erol"],
              @"S" : @[@"Sabrina Evoy", @"Sabrina Tiong", @"Sarah Smith", @"Serena Yuan", @"Sophie Kim", @"Stephanie Smittkamp"],
              @"Y" : @[@"Yumi Tittiger"]};
    allNames = [NSArray arrayWithObjects:@"Alexandra Rugg", @"Alexis deMontford-Shepherd", @"Carla Ramazan", @"Catherine Line", @"Elena Albregts", @"Eric Baggins", @"Lauren Klein", @"Olina Zhu", @"Olivia Sison", @"Omercan Erol", @"Sabrina Evoy", nil];
    firstLetters = [[names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, width, height) style:UITableViewStylePlain];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView reloadData];
    
    [self.view addSubview:tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [firstLetters count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionTitle = [firstLetters objectAtIndex:section];
    NSArray *sectionNames = [names objectForKey:sectionTitle];
    return [sectionNames count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [firstLetters objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:identifier];
    }
    NSString *sectionTitle = [firstLetters objectAtIndex:indexPath.section];
    NSArray *sectionNames = [names objectForKey:sectionTitle];
    NSString *name = [sectionNames objectAtIndex:indexPath.row];
    cell.textLabel.text = name;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


