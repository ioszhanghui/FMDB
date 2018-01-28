//
//  FMDBManager.h
//  FMDB
//
//  Created by 小飞鸟 on 2018/1/18.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBManager : NSObject

/*单例*/
+(FMDBManager*)shareManager;
/*创建数据库文件*/
-(void)createFMDB;
/*创建表*/
-(void)createTable;
/*插入数据*/
-(void)insertIntoData;
/*更新数据*/
-(void)updateData;
/*删除数据*/
-(void)deleteData;
/*查询数据*/
-(void)selectData;

@end
