//
//  SGBarButtonItem.h
//  SGTestDemo
//
//  Created by SG on 2019/8/31.
//  Copyright © 2019 SG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SGBarButtonItemType) {
    SGBarButtonItemTypeBack,
};

@protocol SGBarButtonItemDelegate <NSObject>

@optional

- (void)clickBarButtonItem:(UIBarButtonItem *)sender type:(SGBarButtonItemType)type;

- (void)clickBackBarButtonItem:(UIBarButtonItem *)sender;

- (UIImage *)barButtonItemImageForType:(SGBarButtonItemType)type;

- (NSString *)barButtonItemTitleForType:(SGBarButtonItemType)type;

@end

@interface SGBarButtonItem : UIBarButtonItem

@property (nonatomic, assign, readonly) SGBarButtonItemType barButtonItemType;

@property (nonatomic, weak) id<SGBarButtonItemDelegate> delegate;

+ (NSArray *)barButtonItemsWithTypes:(NSArray *)types delegate:(id)delegate;

@end

NS_ASSUME_NONNULL_END
