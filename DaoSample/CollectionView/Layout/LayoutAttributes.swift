//
//  LayoutAttributes.swift
//  DaoSample
//
//  Created by xzh on 2021/3/7.
//

import UIKit

/**
 一个布局对象，用于管理集合视图中给定项目的与布局相关的属性
 
 当集合视图要求布局对象创建此类的实例时，布局对象将创建此类的实例。
 反过来，收集视图使用布局信息将单元格和补充视图放置在其边界内
 
 
 在大多数情况下，请按原样使用此类。 如果要用自定义布局属性补充基本布局属性，则可以子类化并定义要存储其他布局数据的任何属性。 由于布局属性对象可以由集合视图复制，因此请通过实现适合将自定义属性复制到子类的新实例的任何方法，确保子类符合NSCopying协议。 除了定义子类之外，UICollectionReusableView对象还需要实现apply（_ :)方法，以便它们可以在布局时应用任何自定义属性。
 
 如果您继承并实现了任何自定义布局属性，则还必须重写继承的isEqual：方法以比较属性的值。
 在iOS 7和更高版本中，如果集合属性未更改，则集合视图将不应用布局属性。
 它通过使用isEqual：方法比较旧属性对象和新属性对象来确定属性是否已更改。
 因为此方法的默认实现仅检查此类的现有属性，所以您必须实现自己的方法版本以比较任何其他属性。
 如果您的自定义属性都相等，请调用super并在实现结束时返回结果值
 */

class LayoutAttributes: UICollectionViewLayoutAttributes {
    
    /**
     crate
     1. init(forCellWith: IndexPath)
     2. init(forSupplementaryViewOfKind: String, with: IndexPath)
     3. init(forDecorationViewOfKind: String, with: IndexPath)

     */
    
    override func isEqual(_ object: Any?) -> Bool {
        return super.isEqual(object)
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        return super.copy(with: zone)
    
    }
}


extension LayoutAttributes {
    func identifying() {
        //集合视图中item的索引路径。
        let _ = self.indexPath
        //item的类型
        let _ = self.representedElementCategory
        //目标视图的特定于布局的标识符
        let _ = self.representedElementKind
    }
    
    func attributes() {
        let _ = self.frame
        
        let _ = self.bounds
        //控制item的中心点
        let _ = self.center
        //控制item的大小
        let _ = self.size
        //控制item的3D变化
        let _ = self.transform3D
        //控制item大小位置变化
        let _ = self.transform
        //控制item的透明度
        let _ = self.alpha
        //控制item在z轴的位置
        let _ = self.zIndex
        //控制item的是否显示
        let _ = self.isHidden
    }
}
