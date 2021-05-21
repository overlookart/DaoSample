//
//  CusLayoutAttribute.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/21.
//

import UIKit

class CusLayoutAttributes: LayoutAttributes {
    var position: CGFloat = 0
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let obj = object as? CusLayoutAttributes else {
            return false
        }
        
        var isEqual = super.isEqual(object)
        isEqual = isEqual && (self.position == obj.position)
        return isEqual
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! CusLayoutAttributes
        copy.position = self.position
        return copy
    }
    
}
