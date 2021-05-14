//
//  CoreData.swift
//  DaoSample
//
//  Created by xzh on 2021/2/3.
//

import Foundation
import CoreData
/// 操作协议
protocol Operate {
    
}

class CoreData {
    private static let instance = CoreData()
    class var share: CoreData {
        return instance
    }
    
    //Core Data 持久容器
    lazy var persistentContainer: PersistentContainer = {
        //初始化 数据模型的文件名
       let container = PersistentContainer(name: "BiologyModel")
        //加载所有持久性存储。
        container.loadPersistentStores { (description, error) in
            if let err = error {
                fatalError("Unable to load persistent stores: \(err)")
            }else {
                print("Core Data 配置成功")
                print("Core Data url:",description.url?.absoluteString ?? "")
                print("Core Data type:",description.type)
                print("Core Data pragmas:",description.sqlitePragmas)
            }
        }
        return container
    }()
    
    
    /// 查询 core data 数据
    /// - Parameter entityName: 查询参数
    /// - Returns: 查询结果
    func find(entityName: String) -> [BiologyLevel]? {
        let fetchRequest = NSFetchRequest<BiologyLevel>(entityName: entityName)
        let results = try? CoreData.share.persistentContainer.viewContext.fetch(fetchRequest)
        
        return results
    }
    
    /// 插入一条数据
    /// - Parameter objectType: 数据类
    /// - Returns: 数据库的数据模型
    private func insertObject(objectType: NSManagedObject.Type) -> NSManagedObject  {
        let entityName = "\(objectType)"
        let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: self.persistentContainer.viewContext)
        return entity
    }
    
    
    
    func addBiology(name: String) -> BiologyKingdom {
//        let b = NSEntityDescription.insertNewObject(forEntityName: "BiologyLevel", into: self.persistentContainer.viewContext) as! BiologyLevel
//        b.name = name
        
        
        let k = BiologyKingdom(context: self.persistentContainer.viewContext)
        k.name = name
        return k
    }
    
    func save() {
        self.persistentContainer.saveContext()
    }
}

extension CoreData {
    
    /// 添加一种生物等级
    /// - Parameter name: 名称
    /// - Returns: 数据模型
    func addBiologyLevel(name: String) -> BiologyLevel {
        let biologyLevel = self.insertObject(objectType: BiologyLevel.self) as! BiologyLevel
        biologyLevel.name = name
        self.save()
        return biologyLevel
    }
}
