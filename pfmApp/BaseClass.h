//
//  BaseClass.h
//
//  Created by Senthilkumar N on 26/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *soundFile;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *internalBaseClassDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
