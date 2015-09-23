//
//  PersonViewController.m
//  PersonList
//
//  Created by Brock Oberhansley on 9/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonController.h"

static NSString * const cellID = @"cellID";

@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
//    Person *newPerson = [Person new];
//    newPerson.name = @"Bob";
//    [[PersonController sharedInstance] addPerson:newPerson];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:tableView];
//    tableView.backgroundColor = [UIColor blueColor];
    
    tableView.dataSource = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //this is what I learned
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    Person *person = [PersonController sharedInstance].personList[indexPath.row];
    cell.textLabel.text = person.name;

    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [PersonController sharedInstance].personList.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
