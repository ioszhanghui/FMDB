//
//  FMDBManager.m
//  FMDB
//
//  Created by 小飞鸟 on 2018/1/18.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import "FMDBManager.h"
#import "FMDatabase.h"

@implementation FMDBManager{
    
    FMDatabase * fmdb;//数据库对象
}

/*单例*/
+(FMDBManager*)shareManager{
    static FMDBManager * manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager =[FMDBManager new];
    });
    return manager;
}

/*创建数据库文件*/
-(void)createFMDB{
    //数据库文件存放路径
    NSString * documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES ) firstObject];
    //sqlite 数据库文件路径
    NSString * sqlitePath =[documentPath stringByAppendingPathComponent:@"Student.sqlite"];
    //2.获得数据库
    fmdb = [FMDatabase databaseWithPath:sqlitePath];
    
}

/*创建表*/
-(void)createTable{

    if ([fmdb open]) {
       
        NSString * sqlStr = @"CREATE TABLE IF NOT EXISTS Person (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL)";
        BOOL result = [fmdb executeUpdate:sqlStr];
        if (result) {
            //数据库 表创建成功
        }
        [fmdb close];//关闭数据库
    }
}
/*插入数据*/
-(void)insertIntoData{

    if ([fmdb open]) {
        NSString * sqlStr =@"INSERT INTO Person(name ,age) values('张辉',20)";
        BOOL res2 = [fmdb executeUpdate:sqlStr];
        if (res2) {
            //数据插入成功
        }
        [fmdb close];
    }
}
/*更新数据*/
-(void)updateData{
    if ([fmdb open]) {
        
        NSString * sqlStr =@"UPDATE Person  SET name = '李四' where id = 1";
        BOOL res2 = [fmdb executeUpdate:sqlStr];
        if (res2) {
            //更新数据成功
        }
        [fmdb close];
    }
    
}
/*删除数据*/
-(void)deleteData{
    
    if ([fmdb open]) {
        
        NSString * sqlStr =@"delete from Person where id = 2;";
        BOOL res2 = [fmdb executeUpdate:sqlStr];
        if (res2) {
            //删除数据成功
        }
        [fmdb close];
    }
}
/*查询数据*/
-(void)selectData{
    
    if ([fmdb open]) {
        
        NSString * sql = @"select * from Person ";
        FMResultSet * rs = [fmdb executeQuery:sql];
        while ([rs next]) {
            int Id = [rs intForColumn:@"id"];
            NSString * name = [rs stringForColumn:@"name"];
            NSString * age = [rs stringForColumn:@"age"];
            NSString * sex = [rs stringForColumn:@"sex"];
            NSLog(@"id = %d, name = %@, age = %@  address = %@", Id, name, age, sex);
        }
        [fmdb close];
        
    }
}

@end
