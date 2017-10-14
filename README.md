# SingleSelectionController
This Controller allows you to pass a data source array and select single item from it by using delegate methods. You can also search from that given source list. 

        SingleSelectionViewController *singleSelctionVC = [[SingleSelectionViewController alloc] initWithNibName:@"SingleSelectionViewController" bundle:nil];
        
        singleSelctionVC.dataList = list; // your data list 
        
        singleSelctionVC.delegate=self; //assign delegate
        
        
        
You should apply these three methods to work this 

      - (void) objectSelected:(id)object;
It returns the selected object.

      - (NSPredicate *) getSearchPredicateForText:(NSString *)string;
It provides the Predicate for search in data list


      - (NSString *) getTitleForCell:(NSInteger)indexPath fromList:(NSArray *)array;
It provide the title for the row of table from given array
