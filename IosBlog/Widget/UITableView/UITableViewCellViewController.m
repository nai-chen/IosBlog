//
//  UITableViewCellViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/4.
//

#import "UITableViewCellViewController.h"

#import "Masonry.h"

@interface UITableViewCellViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation UITableViewCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
            
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(50);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;

        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
        
    if (indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
        cell.textLabel.text = @"title";
        cell.imageView.image = [UIImage imageNamed:@"choice_s"];
    } else if (indexPath.row == 1) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellId"];
        cell.textLabel.text = @"title";
        cell.detailTextLabel.text = @"subtitle";
        cell.imageView.image = [UIImage imageNamed:@"choice_s"];
    } else if (indexPath.row == 2) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"CellId"];
        cell.textLabel.text = @"title";
        cell.detailTextLabel.text = @"subtitle";
    } else if (indexPath.row == 3) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
        cell.textLabel.text = @"title";
        cell.detailTextLabel.text = @"subtitle";
        cell.imageView.image = [UIImage imageNamed:@"choice_s"];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
        cell.textLabel.text = @"title";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.row == 4) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else if (indexPath.row == 5) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else if (indexPath.row == 6) {
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        } else if (indexPath.row == 7) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else if (indexPath.row == 8) {
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        } else if (indexPath.row == 9) {
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"choice_s"]];
        }
    }
    
    return cell;
}


@end
