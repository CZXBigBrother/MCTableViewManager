# 革命性的UITableView的使用体验,彻底告别 ~~```ifelse```~~
![image](https://github.com/CZXBigBrother/MCTableViewManager/blob/master/MC.gif)
```
曾经的tableview使用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    xxxxCell * cell = [xxxxCell cellWithTableView:tableView];
    if (indexPath.row == 0) {
            cell.lblFlageLevel.text = @"xxxxxx";
    }else (indexPath.row == 1) {
            cell.lblFlageLevel.text = @"xxxxxx";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        return 10;
    }
    return 44;
}
```
这种使用方式存在巨大的痛点,每次需要改变tableview的结构都需要改变众多的判断,如果结果复杂,改起来都是崩溃的,包括didSelectRowAtIndexPath方法heightForRowAtIndexPath等等都需要一起改变.
#### 为了解决这种问题设计了一套新的使用方式,让tableview之后的使用提供了更好的拓展性,让cell的添加修改拓展完全脱离系统的delegate方法
###### PS:什么情况下适合使用这套框架:1:tableview中种类多,结果复杂 2:需要更新实际情况动态的改变cell的显示结构,对于这两种情况使用这套框架是非常爽的,但是对于结构单一 比如 只存在一种cell 类型等,就不必使用了,反而会增加你的工作量
```
看看新的使用方式
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.myManage MC_numberOfSectionsInTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.myManage MC_numberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (UITableViewCell *)[self.myManage MC_cellForRowAtIndexPath:indexPath withTarget:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.myManage MC_cellheightForRowAtIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.myManage MC_didSelectRowAtIndexPath:indexPath withTarget:self];
}
```
### 所有的数据通过一个manager管理,只需要改变manager的数据队列就能改变界面的显示
```
那么我们现在来看看如何来创建cell 和点击的方法
先创建一个模型,通过字符串转义成SEL的方式创建
@interface MCBaseDataModel : NSObject

/**
 cell的创建方法
 */
@property (copy, nonatomic)   NSString *MCItemCell;

/**
 cell的点击selected事件,如果不需要事件,可以赋值为nil或者[nsnull null]
 */
@property (copy, nonatomic)   NSString *MCItemAction;

/**
 cell需要赋值的参数 注意:目前只支持一个参数或者nil,如果需要更多参数,可以使用NSDictionary,NSArray,NSSet或者自定义对象等
 */
@property (strong, nonatomic) id MCItemCellParam;

/**
 cell selected事件需要的参数 注意:目前最多支持10个参数
 */
@property (strong, nonatomic) NSArray *MCItemActionParams;

/**
 cell的高度
 */
@property (assign, nonatomic) CGFloat MCItemHeight;

/**
 一个创建cell的示例

 @param cellParam cell需要的参数
 @param acitonParams cell点击事件需要的参数
 @return cell对象
 */
+ (instancetype)initWithModelWithData:(id)cellParam withAcitonParams:(id)acitonParams;
@end

+ (instancetype)initWithModelWithData:(id)cellParam withAcitonParams:(id)acitonParams
{
    AExampleCell * data = [[AExampleCell alloc]init];
    data.MCItemCell = @"AExampleCell";
    data.MCItemAction = @"AExampleAction:";
    data.MCItemHeight = 50;
    data.MCItemCellParams = cellParam;
    data.MCItemActionParams = acitonParams;
    return data;
}

ViewController 对象模型中的方法
#pragma mark - 模拟创建cell
- (UITableViewCell *)AExampleCell {
    static NSString *ID = @"AExampleCell";
    UITableViewCell *cell = [self.myMCTableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"AExampleCell"];
    return cell;
}

- (UITableViewCell *)BExampleCell:(NSString *)param {
    static NSString *ID = @"BExampleCell";
    UITableViewCell *cell = [self.myMCTableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"BExampleCell param = %@",param];
    return cell;
}
#pragma mark - 模拟cell的点击事件
- (void)AExampleAction:(NSString *)text {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)BExampleAction:(NSString *)text {
    NSLog(@"BExampleAction %@",text);
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);
    self.myMCTableView.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    
}

```
##加载数据的方式
```
#pragma mark - 模拟数据加载
- (void)loadSettingItems
{
    self.itemsArray = @[
                        @[[AExampleCell initWithModelWithData:nil withAcitonParams:@[@"AcitonParam --- A"]]],
                        @[[BExampleCell initWithModelWithData:@"B Name" withAcitonParams:@[@"AcitonParam --- B"]]]
                        ];
    [self.myManage updateDatas:[NSMutableArray arrayWithArray:self.itemsArray]];
}
```
在以后的使用时,需要添加一个cell 类型只需要添加一个类似```- (UITableViewCell *)BExampleCell```的方法,然后改变myManage队列中的数据,就可以重新显示,使之后的使用中完全脱离tableview delegate
# 所有的API
```
/**
 初始化

 @param data 数据队列
 */
- (instancetype)initWithDatas:(NSMutableArray *)data;

/**
 更新队列

 @param data 队列数据
 */
- (void)updateDatas:(NSMutableArray *)data;
/**
 返回cell

 @param indexPath 和系统返回的indexPath相同
 @param target 执行方法的对象
 @return 对象
 */
- (instancetype)MC_cellForRowAtIndexPath:(NSIndexPath *)indexPath withTarget:(id)target;

/**
 返回cell高度

 @param indexPath 和系统返回的indexPath相同
 @return 高度
 */
- (CGFloat)MC_cellheightForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 返回cell点击事件

 @param indexPath 和系统返回的indexPath相同
 @param target 执行方法的对象
 */
- (void)MC_didSelectRowAtIndexPath:(NSIndexPath *)indexPath withTarget:(id)target;

/**
 返回队列组数

 @return 返回队列组数
 */
- (NSInteger)MC_numberOfSectionsInTableView;

/**
 返回队列组中的个数

 @param section 组index
 @return 返回队列组中的个数
 */
- (NSInteger)MC_numberOfRowsInSection:(NSInteger)section;
```
# 实现原理
主要通过objectiv-c动态的属性,直接将string转成SEL然后去执行,原理非常的简单,中间也借鉴了jspatch部分的写法,本质上就是下面这样一句话
```
id (*new_msgSend0)(id, SEL,...) = (id (*)(id, SEL,...)) objc_msgSend;
```
