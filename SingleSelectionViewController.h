//
//  SingleSelectionViewController.h
//  Demo
//
//  Created by Tallha Sarwar on 25/09/2016.
//  Copyright (c) 2014 Pro. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol SingleObjectSelectionDelegate <NSObject>

- (void) objectSelected:(id)object;

- (NSPredicate *) getSearchPredicateForText:(NSString *)string;


- (NSString *) getTitleForCell:(NSInteger)indexPath fromList:(NSArray *)array;



@end

@interface SingleSelectionViewController : NSViewController

@property(nonatomic,weak) id<SingleObjectSelectionDelegate> delegate;

@property(nonatomic,weak) IBOutlet NSTableView *tableView;

@property(nonatomic,weak) IBOutlet NSSearchField *searchField;

@property(nonatomic,strong) NSArray * dataList;

@property(nonatomic,assign) BOOL searching;

@end
