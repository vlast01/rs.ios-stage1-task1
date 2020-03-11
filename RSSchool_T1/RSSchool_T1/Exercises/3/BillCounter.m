#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
   
    NSInteger totalPrice = 0;
    for (NSNumber *num in bill) {
      totalPrice += [num intValue];
    }
    
    NSInteger correctBill = totalPrice - [[bill objectAtIndex:index] intValue];
    
    if ([sum intValue] == correctBill/2) {
        return @"Bon Appetit";
    }
    else {
        NSInteger refund = [sum intValue] - correctBill/2;
        return [NSString stringWithFormat: @"%ld",(long)refund];
    }
}

@end
