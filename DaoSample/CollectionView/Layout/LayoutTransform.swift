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
        let scrollDirection = view.scrollDirection
        let itemSpacing = scrollDirection == .horizontal ? attributes.bounds.width : attributes.bounds.height
        switch self.type {
        case .crossFading:
            var zIndex = 0
            var alpha: CGFloat = 0
            var transForm = CGAffineTransform.identity
            switch scrollDirection {
            case .horizontal:
                transForm.tx = -itemSpacing * position
            case .vertical:
                transForm.ty = -itemSpacing * position
            }
            if abs(position) < 1 {
                alpha = 1 - abs(position)
                zIndex = 1
            }else{
                alpha = 0
                zIndex = Int.min
            }
            attributes.alpha = alpha
            attributes.transform = transForm
            attributes.zIndex = zIndex
        case .zoomOut:
            var alpha: CGFloat = 0
            var transform = CGAffineTransform.identity
            switch position {
            case -CGFloat.greatestFiniteMagnitude ..< -1 : // [-Infinity ,-1]
                alpha = 0
            case -1 ... 1 :
                let scaleFactor = max(self.minimumScale, 1 - abs(position))
                transform.a = scaleFactor
                transform.b = scaleFactor
                switch scrollDirection {
                case .horizontal:
                    let vertMargin = attributes.bounds.height * (1 - scaleFactor) / 2
                    let horzMargin = itemSpacing * (1 - scaleFactor) / 2
                    transform.tx = position < 0 ? (horzMargin - vertMargin * 2) : (-horzMargin + vertMargin * 2)
                case .vertical:
                    let horzMargin = attributes.bounds.width * (1 - scaleFactor) / 2
                    let vertMargin = itemSpacing * (1 - scaleFactor) / 2
                    transform.ty = position < 0 ? (vertMargin - horzMargin * 2) : (-vertMargin + horzMargin * 2)
                }
                alpha = self.minimumScale + (scaleFactor - self.minimumScale) / (1 - self.minimumScale)
            case 1 ... CGFloat.greatestFiniteMagnitude: //(1, +Infinity)
                alpha = 0
            default:
                break
            }
        case .depth:
            break
        case .overlap, .linear:
            break
        case .coverFlow:
            break
        case .ferrisWheel, .invertedFerrisWheel:
            break
        case .cubic:
            break
        }
    }
    
    func proposedInteritemSpacing() -> CGFloat {
        guard let view = self.view else {
            return 0
        }
        let scrollDirection = view.scrollDirection
        switch self.type {
        case .overlap:
            guard scrollDirection == .horizontal else { return 0 }
            return view.itemSize.width * -self.minimumScale * 0.6
        case .linear:
            guard scrollDirection == .horizontal else { return 0 }
            return view.itemSize.width * -self.minimumScale * 0.2
        case .coverFlow:
            guard scrollDirection == .horizontal else { return 0 }
            return -view.itemSize.width * sin(.pi * 0.25 * 0.25 * 0.3)
        case .ferrisWheel, .invertedFerrisWheel:
            guard scrollDirection == .horizontal else { return 0 }
            return -view.itemSize.width * 0.15
        case .cubic:
            return 0
        default:
            break
        }
        return view.interitemSpacing
        
    }
}
