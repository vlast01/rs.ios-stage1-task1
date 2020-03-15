#import "PalindromeSolver.h"

@implementation PalindromeSolver

- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    int counter = 0;
    NSMutableArray * index = [NSMutableArray arrayWithCapacity:1];
    NSMutableString * result = [NSMutableString stringWithString:s];
    for(int i = 0; i < [n intValue]/2; i++){
        if([s characterAtIndex:i]!=[s characterAtIndex:([n intValue]-i-1)]){
            counter++;
            [index addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    if (counter > [k intValue]){
        return @"-1";
    }
    
    for(int i = 0; i < [n intValue]/2; i++){
        if ([k intValue]-counter>=2 && ![index containsObject:[NSNumber numberWithInt:i]] && [[NSNumber numberWithChar:[s characterAtIndex:i]] intValue]!=9) {
            [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
            [result replaceCharactersInRange:NSMakeRange(([n intValue]-i-1), 1) withString:@"9"];
            counter-=2;
            
        }
        else if ([index containsObject:[NSNumber numberWithInt:i]] && [k intValue]>counter && [[NSNumber numberWithChar:[s characterAtIndex:i]] intValue]!=9 && [[NSNumber numberWithChar:[s characterAtIndex:([n intValue]-i-1)]] intValue]!=9) {
            [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
            [result replaceCharactersInRange:NSMakeRange(([n intValue]-i-1), 1) withString:@"9"];
            counter--;
        }
        
        else if ([index containsObject:[NSNumber numberWithInt:i]] && [k intValue]==counter){
            if ([[NSNumber numberWithChar:[s characterAtIndex:i]] intValue]<[[NSNumber numberWithChar:[s characterAtIndex:([n intValue]-i-1)]] intValue]){
                [result replaceCharactersInRange:NSMakeRange(i, 1) withString: [NSString stringWithFormat:@"%C", [s characterAtIndex:([n intValue]-i-1)]]];
            }
            else {
                [result replaceCharactersInRange:NSMakeRange(([n intValue]-i-1), 1) withString:[NSString stringWithFormat:@"%C", [s characterAtIndex:i]]];
            }
            counter--;
        }
        if (counter==0){
            
            break;
        }
        
    }
    return result;
    
}

@end
