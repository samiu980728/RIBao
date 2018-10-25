//
//  NewsTableViewCell.h
//  ribao
//
//  Created by 萨缪 on 2018/10/23.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell

//每个cell要用到的label 与 button
@property (nonatomic, strong) UILabel * newsLabel;

@property (nonatomic, strong) UIImageView * newsImageView;


@end
