//
//  CustomCollectionView.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/21.
//

import UIKit

class CustomCollectionView: UICollectionView {

    #if !os(tvOS)
    override var scrollsToTop: Bool{
        set{
            super.scrollsToTop = false
        }
        get{
            return false
        }
    }
    #endif
    override var contentInset: UIEdgeInsets{
        set{
            super.contentInset = .zero
            if newValue.top > 0 {
                let contentOffset = CGPoint(x: self.contentOffset.x, y: self.contentOffset.y + newValue.top)
                self.contentOffset = contentOffset
            }
        }
        get{
            return super.contentInset
        }
    }
    
    var itemSize: CGSize = automaticSize {
        didSet{
            
        }
    }
    
    var interitemSpacing: CGFloat = 0 {
        didSet {
            
        }
    }
    
    
    var scrollDirection: CustomCollectionView.ScrollDirection = .horizontal {
        didSet{
//            
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit()  {
        self.contentInset = .zero
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        if #available(iOS 10.0, *) {
            self.isPrefetchingEnabled = false
        }
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
        #if !os(tvOS)
        self.scrollsToTop = false
        self.isPagingEnabled = false
        #endif
    }
}

extension CustomCollectionView {
    enum ScrollDirection: Int {
        case horizontal
        case vertical
    }
    
    public static let automaticDistance: UInt = 0
    
    public static let automaticSize: CGSize = .zero
}
