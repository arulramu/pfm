//
//  JSONReader.m
//  pfmApp
//
//  Created by Senthilkumar N on 26/06/16.
//  Copyright © 2016 Senthilkumar N. All rights reserved.
//

#import "JSONReader.h"

@implementation JSONReader
-(id) JSONParse:(NSData*) data {
    NSError *error = nil;
    id JSONObj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    return JSONObj;
}

-(id) JSONParseFromBundle {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"periyar" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    id JSONObj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    return JSONObj;
}
@end
