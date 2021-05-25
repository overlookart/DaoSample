//
//  TestCollectionViewLayout.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/25.
//

import UIKit

class TestCollectionViewLayout: UICollectionViewLayout {
    ///列数
    var colCount: Int = 3 {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    
    ///行数
    var rowCount: Int = 0
    
    ///item的大小
    var itemSize: CGSize = .zero
    
    ///item的间距
    var margin: CGFloat = 0;
    
    override func prepare() {
        super.prepare()
        
        
    }
    
    override var collectionViewContentSize: CGSize{
        guard let view = self.collectionView else { return .zero }
        
        return CGSize(width: view.width, height: view.height)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let view = self.collectionView else {
            return []
        }
        var attributesArray: [UICollectionViewLayoutAttributes] = []
        let sectionCount = view.numberOfSections
        for s in 0..<sectionCount {
            let itemCount = view.numberOfItems(inSection: s)
            for i in 0..<itemCount {
                let indexPath = IndexPath(item: i, section: s)
                let attributes = self.layoutAttributesForItem(at: indexPath)
                attributesArray.append(attributes ?? UICollectionViewLayoutAttributes(forCellWith: indexPath))
            }
        }
        return attributesArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        //计算item的farme
        //x: 列数 * (item.width + margin)
        //y: 行数 * (item.height + margin)
        //frame: (x,y,item.width,item.height)
//        attributes.frame
        let col = indexPath.item % self.colCount
        let row = indexPath.item / self.colCount
        
        
        attributes.frame = CGRect(x:col * (55) , y: row*(55), width: 50, height: 50)
        var transform3D = CATransform3DIdentity
        transform3D.m34 = -0.002
        attributes.transform3D = CATransform3DRotate(transform3D, 1, 1, 0, 0)
        return attributes;
    }
}
