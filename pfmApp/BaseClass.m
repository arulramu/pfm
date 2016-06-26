//
//  BaseClass.m
//
//  Created by Senthilkumar N on 26/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"


NSString *const kBaseClassSoundFile = @"soundFile";
NSString *const kBaseClassPic = @"pic";
NSString *const kBaseClassTitle = @"title";
NSString *const kBaseClassDescription = @"description";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize soundFile = _soundFile;
@synthesize pic = _pic;
@synthesize title = _title;
@synthesize internalBaseClassDescription = _internalBaseClassDescription;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.soundFile = [self objectOrNilForKey:kBaseClassSoundFile fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kBaseClassPic fromDictionary:dict];
            self.title = [self objectOrNilForKey:kBaseClassTitle fromDictionary:dict];
            self.internalBaseClassDescription = [self objectOrNilForKey:kBaseClassDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.soundFile forKey:kBaseClassSoundFile];
    [mutableDict setValue:self.pic forKey:kBaseClassPic];
    [mutableDict setValue:self.title forKey:kBaseClassTitle];
    [mutableDict setValue:self.internalBaseClassDescription forKey:kBaseClassDescription];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.soundFile = [aDecoder decodeObjectForKey:kBaseClassSoundFile];
    self.pic = [aDecoder decodeObjectForKey:kBaseClassPic];
    self.title = [aDecoder decodeObjectForKey:kBaseClassTitle];
    self.internalBaseClassDescription = [aDecoder decodeObjectForKey:kBaseClassDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_soundFile forKey:kBaseClassSoundFile];
    [aCoder encodeObject:_pic forKey:kBaseClassPic];
    [aCoder encodeObject:_title forKey:kBaseClassTitle];
    [aCoder encodeObject:_internalBaseClassDescription forKey:kBaseClassDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.soundFile = [self.soundFile copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.internalBaseClassDescription = [self.internalBaseClassDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
