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
    
    //Core Data 持久容器 数据库
    lazy var persistentContainer: PersistentContainer = {
        //初始化 数据库的文件名
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
    private func fetchObjects(objectType: NSManagedObject.Type) -> [Any]? {
        let entityName = "\(objectType)"
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let result = try? self.persistentContainer.viewContext.fetch(fetchRequest)
        return result
    }
    
    /// 删除 core data 数据
    /// - Parameter object: 数据库存在的数据
    func deleteObject(object: NSManagedObject) {
        self.persistentContainer.viewContext.delete(object)
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
        let biologyLevel = self.persistentContainer.createEntityObject(objectType: BiologyLevel.self) as! BiologyLevel
        biologyLevel.name = name
        self.save()
        return biologyLevel
    }
    
    /// 查询所有的生物等级
    /// - Returns: 查询结果
    func findBiologyLevels() -> [BiologyLevel] {
        if let results = self.fetchObjects(objectType: BiologyLevel.self) {
            let bls = results.map { object -> BiologyLevel in
                let bl = object as! BiologyLevel
                return bl
            }
            return bls
        }else{
            return []
        }
    }
}
