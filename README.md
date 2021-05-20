# SingleSelectionController
This Controller allows you to pass a data source array and select single item from it by using delegate methods. You can also search from that given source list. 
 
 ```objc
        SingleSelectionViewController *singleSelctionVC = [[SingleSelectionViewController alloc] initWithNibName:@"SingleSelectionViewController" bundle:nil];
        
        singleSelctionVC.dataList = list; // your data list 
        
        singleSelctionVC.delegate=self; //assign delegate
```  
        
        
You should apply these three methods to work this 
 ```objc
      - (void) objectSelected:(id)object;
  ```
It returns the selected object.
 ```objc
      - (NSPredicate *) getSearchPredicateForText:(NSString *)string;
```
It provides the Predicate for search in data list

 ```objc
      - (NSString *) getTitleForCell:(NSInteger)indexPath fromList:(NSArray *)array;
```
It provide the title for the row of table from given array
