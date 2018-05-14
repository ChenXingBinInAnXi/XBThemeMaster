
//
//  XBTestCell.m
//  XBThemeMaster
//
//  Created by chenxingbin on 2018/5/10.
//  Copyright © 2018年 chenxingbin. All rights reserved.
//

#import "XBTestCell.h"
#import "XBTheme.h"

@interface XBTestCell()
@property (nonatomic,strong) UILabel *textDataLabel;
@property (nonatomic,strong) UIImageView *iconIV;
@end

@implementation XBTestCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    XBTestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XBTestCell"];
    if (cell == nil) {
        cell = [[XBTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XBTestCell"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    
    [self.contentView addSubview:self.textDataLabel];
    [self.contentView addSubview:self.iconIV];
    
    self.textDataLabel.frame = CGRectMake(20, 10, 200, 30);
    self.iconIV.frame = CGRectMake(220, 10, 34, 34);
    return self;
}


-(UILabel *)textDataLabel{
    if (_textDataLabel == nil) {
        _textDataLabel = [UILabel new];
        _textDataLabel.numberOfLines = 0;
        _textDataLabel.xb_textColorAction = [XBCustomerManager xb_nomalTextAction];
        _textDataLabel.text = @"you are a picker";
    }
    return _textDataLabel;
}


-(UIImageView *)iconIV{
    if (_iconIV == nil) {
        _iconIV = [UIImageView new];
        _iconIV.xb_imageAction = ^UIImage *(XBTheme *theme) {
            if ([theme isEqualToString:XBThemeNormal]) {
                return [UIImage imageNamed:@"touxian_icon_ZGKathleen"];
            }else{
                return [UIImage imageNamed:@"touxiangIcon_ZGLittleSnail"];
            }
        };
    }
    return _iconIV;
}




@end
