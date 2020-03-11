#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray * array = [NSMutableArray arrayWithArray:sadArray];
    if (array.count == 0){
        return @[];
    }
    else {
        BOOL flag = YES;
        while(flag) {
            flag = NO;
            for(int i = 1; i <= array.count-2; i++) {
                if ([array[i] intValue] > [array[i-1] intValue] + [array[i+1] intValue]) {
                    [array removeObjectAtIndex:i];
                    flag = YES;
                }
            }
        }
        return array;
    }
}

@end
