//
//  CoreData.swift
//  DaoSample
//
//  Created by xzh on 2021/2/3.
//

import Foundation
import CoreData
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
    
    
    func find(entityName: String) -> [BiologyLevel]? {
        let fetchRequest = NSFetchRequest<BiologyLevel>(entityName: entityName)
        let results = try? CoreData.share.persistentContainer.viewContext.fetch(fetchRequest)
        
        return results
    }
    
    func add(entityName: String) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: self.persistentContainer.viewContext)
        let b = entity as! BiologyLevel
        b.name = "test"
        print(b)
    }
    
    func insertObject(entityName: String) -> NSManagedObject {
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
