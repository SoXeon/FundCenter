//
//  NSDictionary+Seruity.h
//  FundCenter
//
//  Created by DP on 15/6/3.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Seruity)

+ (id)dictionaryWithArray:(NSArray *)array;
- (BOOL)arrayIsKeys:(NSArray *)array;

- (id)safeValueForKey:(NSString *)key;

- (id)safeObjectForKey:(NSString *)key;

- (id)safeObjectAtIndex:(NSUInteger)index;

- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey;
- (void)safeSetValue:(id)value forKey:(NSString *)key;
- (void)safeAddObject:(id)anObject;
- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

@end
