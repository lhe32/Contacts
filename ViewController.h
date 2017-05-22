//
//  ViewController.h
//  Contacts
//
//  Created by Detective Lawliet on 5/18/17.
//  Copyright © 2017 Detective Lawliet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *namesList;

@end

