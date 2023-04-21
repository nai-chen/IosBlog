//
//  UKInputTableViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/18.
//

#import "UKInputTableViewController.h"

#import "UKInputTableView.h"
#import "UKInputTableViewCell.h"

@interface UKInputTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UKInputTableView *tableView;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *zipcode;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *mobile;

@property(nonatomic, strong) UIButton *submitButton;

@end

@implementation UKInputTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kStatusBarHeight + 50);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kBottomSafeHeight - 75);
    }];
    
    [self.view addSubview:self.submitButton];
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.tableView.mas_bottom).offset(15);
        make.height.equalTo(@45);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    // 注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 注销键盘出现通知
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    // 注销键盘隐藏通知
    [[NSNotificationCenter defaultCenter]removeObserver: self name:UIKeyboardDidHideNotification object: nil];
}

- (void)keyboardDidShow:(NSNotification *)notification {
    // 获取键盘位置
    NSDictionary *userinfo = [notification userInfo];
    NSValue *value = [userinfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrame = [value CGRectValue];
    
    NSLog(@"keyboardDidShow keyboardFrame = %@", NSStringFromCGRect(keyboardFrame));
    
    UITableViewCell *cell = [self firstResponderCell];
    if (cell) {
        CGFloat tableTop = kStatusBarHeight + 50;
        CGFloat cellMaxY = CGRectGetMaxY(cell.frame) - self.tableView.contentOffset.y + tableTop;
        NSLog(@"keyboardDidShow cell.frame = %@", NSStringFromCGRect(cell.frame));
        NSLog(@"keyboardDidShow cellMaxY = %f", cellMaxY);

        CGFloat bottomHeight = self.view.frame.size.height - cellMaxY;
        CGFloat distance = bottomHeight - 10.0 - keyboardFrame.size.height;

        NSLog(@"keyboardDidShow bottomHeight = %f", bottomHeight);
        if (distance < 0) {
            [UIView animateWithDuration:0.5 animations:^{
                //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
                self.view.frame = CGRectMake(0.0f, distance, self.view.frame.size.width, self.view.frame.size.height);
            }];
        }
    }

}

- (UITableViewCell *)firstResponderCell {
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        if ([cell isKindOfClass:[UKInputTableViewCell class]]) {
            UKInputTableViewCell *visibleCell = (UKInputTableViewCell *)cell;
            if (visibleCell.contentTextField.isFirstResponder) {
                return cell;
            }
        }
    }
    return nil;
}

- (void)keyboardDidHide:(NSNotification *)notification{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0.0f, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

- (UKInputTableView *)tableView {
    if (!_tableView) {
        _tableView = [[UKInputTableView alloc] init];
                
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[UKInputTableViewCell class] forCellReuseIdentifier:@"CellId"];
    }
    return _tableView;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [[UIButton alloc] init];
        [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_submitButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _submitButton;
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UKInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    __weak __typeof(self) weakSelf = self;
    if (indexPath.row == 0) {
        [cell setTitle:@"姓名" hint:@"请输入姓名"];
        [cell setDetail:self.name];
        
        cell.inputChange = ^(NSString * text) {
            weakSelf.name = text;
        };
    } else if (indexPath.row == 1) {
        [cell setTitle:@"地址" hint:@"请输入地址"];
        [cell setDetail:self.address];

        cell.inputChange = ^(NSString * text) {
            weakSelf.address = text;
        };
    } else if (indexPath.row == 2) {
        [cell setTitle:@"邮编" hint:@"请输入邮编"];
        [cell setDetail:self.zipcode];

        cell.inputChange = ^(NSString * text) {
            weakSelf.zipcode = text;
        };
    } else if (indexPath.row == 3) {
        [cell setTitle:@"邮箱" hint:@"请输入邮箱"];
        [cell setDetail:self.email];
        
        cell.inputChange = ^(NSString * text) {
            weakSelf.email = text;
        };
    } else if (indexPath.row == 4) {
        [cell setTitle:@"电话" hint:@"请输入电话"];
        [cell setDetail:self.mobile];
        
        cell.inputChange = ^(NSString * text) {
            weakSelf.mobile = text;
        };
    }
    
    return cell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.submitButton becomeFirstResponder];
}

@end
