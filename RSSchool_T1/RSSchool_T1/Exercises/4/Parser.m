#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSArray * openBracket = @[@"(", @"<", @"["];
    NSArray * closeBracket = @[@")", @">", @"]"];
    NSMutableString * copy = [NSMutableString stringWithString:string];
    NSMutableArray<NSString*>* result = [NSMutableArray arrayWithCapacity:5];

    int repeat = 0;
    
  
        for (int i = 0; i < [string length]; i++){
            for(int j = 0; j < 3; j++){
                if ([NSString stringWithFormat:@"%C",[copy characterAtIndex:i]] == [NSString stringWithFormat:@"%@",[openBracket objectAtIndex:j]]){
                    
                    copy = [copy stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"A"];
               
                    
                    for (int z = i+1; z<[string length]; z++) {
                        
                    if ([NSString stringWithFormat:@"%C",[copy characterAtIndex:z]] == [NSString stringWithFormat:@"%@",[openBracket objectAtIndex:j]])
                    {
                        repeat++;
                        continue;
                    }
                        
                    if ([NSString stringWithFormat:@"%C",[copy characterAtIndex:z]] == [NSString stringWithFormat:@"%@",[closeBracket objectAtIndex:j]] && repeat!=0){
                        repeat--;
                        continue;
                    }
                        
                    if ([NSString stringWithFormat:@"%C",[copy characterAtIndex:z]] == [NSString stringWithFormat:@"%@",[closeBracket objectAtIndex:j]] && repeat==0) {
                                    
                            [result addObject:[string substringWithRange:NSMakeRange(i+1, z-i-1)]];
                            break;
                            
                        }
                    }
                    
                    
            }
            
        }
    }
    

   
    
     return result;
}

    @end
    
