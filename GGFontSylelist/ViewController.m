//
//  ViewController.m
//  GGFontSylelist
//
//  Created by __无邪_ on 15/5/1.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "SettingController.h"
#import "GGFontStyleCell.h"


static NSString *iden = @"FontListCellIdentifier";
static CGFloat fontSize = 38;
static NSString *testText = @"Hello World! 1991";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *familyNames;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewBottomLayout;
@property (nonatomic, strong)NSMutableArray *fontNamesArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.estimatedRowHeight = 104.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    self.fontNamesArr = [[NSMutableArray alloc] init];
    
    for (NSString *familyName in self.familyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        [self.fontNamesArr addObject:fontNames];
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadDataNotification:) name:kNotificationofReloadData object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView setAlpha:0];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
    
    [UIView animateWithDuration:0.75 animations:^{
        [self.tableView setAlpha:1];
    }];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Action

- (IBAction)toSettingControllerAction:(id)sender {
    [self performSegueWithIdentifier:@"toSettingSegue" sender:sender];
}

#pragma mark - 
#pragma mark - Notification

- (void)reloadDataNotification:(NSNotification *)noti{
    testText = noti.object[@"testText"];
    fontSize = [noti.object[@"fontSize"] floatValue];
}


#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.fontNamesArr[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.familyNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GGFontStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
    
    NSString *fontName = self.fontNamesArr[indexPath.section][indexPath.row];
    UIFont *fontStyle = [UIFont fontWithName:fontName size:fontSize];
    
    [cell setStyleText:testText name:fontName withFont:fontStyle];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.familyNames[section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0f;
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    [self.view setNeedsDisplay];
}


#pragma mark - Other
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"toSettingSegue"]) {
        SettingController *controller = (SettingController *)[segue destinationViewController];
        controller.value = fontSize;
        controller.text = testText;
    }
}

@end
