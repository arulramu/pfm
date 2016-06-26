//
//  JSONReader.h
//  pfmApp
//
//  Created by Senthilkumar N on 26/06/16.
//  Copyright © 2016 Senthilkumar N. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONReader : NSObject

-(id) JSONParse:(NSData*) data;

-(id) JSONParseFromBundle;

@end
