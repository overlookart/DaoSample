//
//  CusCollectionLayout.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/25.
//

import UIKit

class CusCollectionLayout: UICollectionViewLayout {
    internal var contentSize: CGSize = .zero
    internal var leadingSpacing: CGFloat = 0
    internal var itemSpacing: CGFloat = 0
    internal var needsReprepare: Bool = true
    internal var scrollDirection: CustomCollectionView.ScrollDirection = .horizontal
    
    override class var layoutAttributesClass: AnyClass{
        return CusLayoutAttributes.self
    }
    
    var view: CustomCollectionView? {
        return self.collectionView as? CustomCollectionView
    }
    
    var collectionViewSize:CGSize = .zero
    var numberOfSections = 1
    var numberOfItems = 0
    var actualInterItemSpacing: CGFloat = 0
    var actualItemSize: CGSize = .zero
    
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        
    }
}
