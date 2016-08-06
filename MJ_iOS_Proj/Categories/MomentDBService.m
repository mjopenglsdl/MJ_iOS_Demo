//
//  MomentDBService.m
//  MJ_iOS_Proj
//
//  Created by minjie on 06/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "MomentDBService.h"
#import "FMDB.h"
#import "UtilMacro.h"

@interface MomentDBService()
@property(strong, nonatomic) FMDatabaseQueue *dbQueue;
@property(strong, nonatomic) NSDictionary *dictTable;

@end


@implementation MomentDBService

SINGLETON_GENERATOR(MomentDBService, sharedService);

-(instancetype)init
{
    if (self=[super init]) {
        [self createTable];
    }
    return self;
}


- (BOOL)createTable
{
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        NSMutableString *strParam = nil;
        NSArray *keys = [self.dictTable allKeys];
        for (NSString *key in keys) {
            NSString *obj = [self.dictTable objectForKey:key];
            
            if (!strParam) {
                strParam = [[NSString stringWithFormat:@"%@ %@",key,obj]mutableCopy];
            }else{
                [strParam appendString:[NSString stringWithFormat:@",%@ %@",key,obj]];
            }
        }
        
        NSString *sql = [NSString stringWithFormat:@"create table if not exists %@  (%@)",TABLE_Moment, strParam];
        result = [db executeUpdate:sql];
    }];
    
    return result;
}

- (BOOL)addRecord:(MomentModel *)model
{
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        if (model) {
            NSString *sql = [NSString stringWithFormat:@"insert into %@ (recordID, name, content, urls) values('%@', '%@', '%@', '%@')", TABLE_Moment, model.strRecordID, model.strName, model.strContent, [model urlStringFromUrlArray]];
            
            result = [db executeUpdate:sql];
        }
        
    }];
    return result;
}


-(BOOL)removeRecordWithID:(NSString *)recordID
{
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        if (recordID) {
            NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE recordID=%@", TABLE_Moment, recordID];
            result = [db executeUpdate:sql];
        }
    }];
    
    return result;
}


#pragma mark - LAZY Loading
-(FMDatabaseQueue *)dbQueue
{
    if (!_dbQueue) {
        NSString *strPath=[NSString stringWithFormat:@"%@/%@/Moment.db", [UtilClass getDocumentsPath], PATH_DB];
        _dbQueue=[FMDatabaseQueue databaseQueueWithPath:strPath];
    }
    
    return _dbQueue;
}


-(NSDictionary *)dictTable
{
    if (!_dictTable) {
        _dictTable=@{
                     @"recordID": @"text primary key",
                     @"name": @"text",
                     @"content": @"text",
                     @"urls": @"text",
                     };
    }
    return _dictTable;
}

@end
