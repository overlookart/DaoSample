//
//  PersistentContainer.swift
//  DaoSample
//
//  Created by xzh on 2021/2/3.
//

import Foundation
import CoreData

//一个将Core Data堆栈封装在您的应用程序中的容器。 数据库
/**
 NSPersistentContainer通过处理托管对象模型（NSManagedObjectModel），
 持久性存储协调器（NSPersistentStoreCoordinator）
 和托管对象上下文（NSManagedObjectContext）的创建，
 简化了核心数据堆栈的创建和管理。
 */
class PersistentContainer: NSPersistentContainer {
    
    /// 用给定的名称和模型初始化一个持久性容器。
    /// - Parameters:
    ///   - name: 名称
    ///   - model: 模型
    override init(name: String, managedObjectModel model: NSManagedObjectModel) {
        super.init(name: name, managedObjectModel: model)
    }
    
    /// 创建一个空的实体模型对象
    /// - Parameter objectType: 实体类型
    /// - Returns: 实体模型对象
    func createEntityObject(objectType: NSManagedObject.Type) -> NSManagedObject {
        let entityName = "\(objectType)"
        let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: viewContext)
        return entity
    }
    
    
    /// 储存数据
    /// - Parameter backgroundContext: 负责应用和数据库之间的交互
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}
