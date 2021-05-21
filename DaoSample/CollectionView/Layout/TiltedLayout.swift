//
//  TiltedLayout.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/21.
//

import UIKit

class TiltedLayout: CollectionViewLayout {

    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
