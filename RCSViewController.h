//
//  RCSViewController.h
//  TableViewController_celulas_dinamica
//
//  Created by Ramon Cruz on 7/9/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCSCustonCell.h"


@interface RCSViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(strong,nonatomic) NSMutableArray *numbers;
@property (strong,nonatomic)NSMutableArray *imagens;
@property(strong,nonatomic) UIRefreshControl *refresh;

@property (weak, nonatomic) IBOutlet UITableViewCell *custonCell;

@end
