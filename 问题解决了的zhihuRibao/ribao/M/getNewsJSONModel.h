//
//  getNewsJSONModel.h
//  ribao
//
//  Created by 萨缪 on 2018/10/25.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "JSONModel.h"

//这个recommenders 得是也要重新写个类？？？

//不应该 需要id 对应获取 所以没有id 有的东西不会出现

@interface sectionJSONModel : JSONModel

@property (nonatomic, strong) NSString * thumbnail;

@property (nonatomic, strong) NSString * id;

@property (nonatomic, strong) NSString * name;

@end


@interface getNewsJSONModel : JSONModel

@property (nonatomic, strong) NSArray * recommenders;
@property (nonatomic, strong) NSString * image;

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * body;
@property (nonatomic, strong) NSString * image_source;
@property (nonatomic, strong) NSString * share_url;
@property (nonatomic, strong) NSString * ga_prefix;

@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSArray * css;
@property (nonatomic, strong) NSArray * js;

@property (nonatomic, strong) NSArray <sectionJSONModel *> * section;




@end

