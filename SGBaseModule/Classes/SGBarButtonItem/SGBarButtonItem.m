//
//  SGBarButtonItem.m
//  SGTestDemo
//
//  Created by SG on 2019/8/31.
//  Copyright © 2019 SG. All rights reserved.
//

#import "SGBarButtonItem.h"

@implementation SGBarButtonItem

+ (NSArray *)barButtonItemsWithTypes:(NSArray *)types delegate:(id)delegate {
    NSMutableArray *items = [NSMutableArray array];
    for (NSNumber *type in types) {
        [items addObjectsFromArray:[self barButtonItemsWithType:type.integerValue delegate:delegate]];
    }
    return items;
}

+ (NSArray *)barButtonItemsWithType:(SGBarButtonItemType)type delegate:(id)delegate {
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    SGBarButtonItem *buttonItem = [[SGBarButtonItem alloc] initWithType:type];
    buttonItem.delegate = delegate;
    return @[buttonItem, spaceItem];
}

- (void)clickBarButtonItem:(UIBarButtonItem *)sender {
    SGBarButtonItemType type = sender.tag;
    if (type == SGBarButtonItemTypeBack) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(clickBackBarButtonItem:)]) {
            [self.delegate clickBackBarButtonItem:sender];
        } else {
            UIViewController *vc = (UIViewController *)self.delegate;
            if (vc.navigationController.viewControllers.count == 1) {
                [vc dismissViewControllerAnimated:YES completion:nil];
            } else {
                [vc.navigationController popViewControllerAnimated:YES];
            }
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(clickBarButtonItem:type:)]) {
            [self.delegate clickBarButtonItem:sender type:type];
        }
    }
}

- (instancetype)initWithType:(SGBarButtonItemType)type title:(NSString *)title {
    if (self = [super initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(clickBarButtonItem:)]) {
        [self setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.0f], NSForegroundColorAttributeName : UIColor.whiteColor} forState:UIControlStateNormal];
        
        self.tag = type;
        _barButtonItemType = type;
    }
    return self;
}

- (instancetype)initWithType:(SGBarButtonItemType)type image:(UIImage *)image {
    if (self = [super initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickBarButtonItem:)]) {
        
        self.tag = type;
        _barButtonItemType = type;
    }
    return self;
}

- (instancetype)initWithType:(SGBarButtonItemType)type {
    
    id obj;
    if (self.delegate && [self.delegate respondsToSelector:@selector(barButtonItemImageForType:)]) {
        obj = [self.delegate barButtonItemImageForType:type];
    } else if (self.delegate && [self.delegate respondsToSelector:@selector(barButtonItemTitleForType:)]) {
        obj = [self.delegate barButtonItemTitleForType:type];
    } else {
        obj = [self objWithType:type];
    }
    
    if (obj == nil || [obj isEqual:NSNull.null]) {
        obj = @"";
    }
    if ([obj isKindOfClass:UIImage.class]) {
        return [self initWithType:type image:obj];
    } else {
        return [self initWithType:type title:obj];
    }
}

- (id)objWithType:(SGBarButtonItemType)type {
    switch (type) {
        case SGBarButtonItemTypeBack:
            return @"返回";
        default:
            return nil;
    }
}

@end
