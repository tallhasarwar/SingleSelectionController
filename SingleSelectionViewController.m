//
//  WGCompaniesViewController.m
//  WGOSX
//
//  Created by Tallha Sarwar on 25/09/2016.
//  Copyright (c) 2014 Pro. All rights reserved.
//

#import "SingleSelectionViewController.h"
#import "WGSharedData.h"

@interface SingleSelectionViewController ()

@property(nonatomic,strong) NSArray * searchList;
@property (weak) IBOutlet NSTextField *noDataFoundLabel;
@property (weak) IBOutlet NSScrollView *scrollViewOutlet;

@end

@implementation SingleSelectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}


-(void) loadView
{
    [super loadView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(controlTextDidChange:) name:NSControlTextDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(controlTextDidEndEditing:) name:NSControlTextDidEndEditingNotification object:nil];
    
    self.tableView.selectionHighlightStyle=NSTableViewSelectionHighlightStyleNone;
    
    self.tableView.headerView=nil;
    
}
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;{
    
     NSString *title = [self.delegate getTitleForCell:row fromList:[self localData]];
    
    return title;
}



- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row;{
    
    
    id object = [[self localData] objectAtIndex:row];

    [self.delegate objectSelected:object];
    
    
    return YES;
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView;{
    
    NSInteger count = [self localData].count;
    
    if (count>0) {
        self.noDataFoundLabel.hidden=YES;
        _scrollViewOutlet.hidden=NO;
    }
    else
    {
        self.noDataFoundLabel.hidden=NO;
        _scrollViewOutlet.hidden=YES;
    }
    
    return count;
    
    return [self localData].count;
}

-(NSArray*) localData{
    
    if(self.searching)
        return self.searchList;
    
    
    return self.dataList;
}



- (void)controlTextDidChange:(NSNotification *)obj {
    
    // You can get the NSTextField, which is calling the method, through the userInfo dictionary.
    NSSearchField *textField = obj.object;
    if(textField == self.searchField)
    {
        
        if (!textField.stringValue.length) {
            
            
            //end search
            
            self.searching=NO;
            
            [self.tableView reloadData];
        }
        else
        {
            //In search
            
            self.searching=YES;
            
            
            //apply predicate here and store it to searchList
            
            
//            if (self.searchField.stringValue.length>2)
            {
                
                self.searchList=[self.dataList filteredArrayUsingPredicate:[self.delegate getSearchPredicateForText:textField.stringValue]];
                [self.tableView reloadData];
            }
            
            
        }
        
    }
}

- (void)controlTextDidEndEditing:(NSNotification *)obj{
    
    // You can get the NSTextField, which is calling the method, through the userInfo dictionary.
    NSSearchField *textField = obj.object;
    if(textField == self.searchField)
    {
        
        if (!textField.stringValue.length) {
            
            
            //end search
            
            self.searching=NO;
            
            [self.tableView reloadData];
        }
        
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSControlTextDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSControlTextDidEndEditingNotification object:nil];
}


@end
