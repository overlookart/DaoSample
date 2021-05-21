//
//  LayoutTransform.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/21.
//

import UIKit

enum LayoutTransformType: Int {
    case crossFading
    case zoomOut
    case depth
    case overlap
    case linear
    case coverFlow
    case ferrisWheel
    case invertedFerrisWheel
    case cubic
}

class LayoutTransform: NSObject {
    internal(set) weak var view: CustomCollectionView?
    var type: LayoutTransformType
    var minimumScale: CGFloat = 0.65
    var minimumAlpha: CGFloat = 0.6
    
    init(type: LayoutTransformType) {
        self.type = type
        switch type {
        case .zoomOut:
            self.minimumScale = 0.85
        case .depth:
            self.minimumScale = 0.5
        default:
            break
        }
    }
    
    func applyTransform(to attributes: CusLayoutAttributes) {
        guard let view = self.view else { return  }
        let position = attributes.position
        let scrollDirection = view.sc
        
    }
}
