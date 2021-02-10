//
//  CollectionViewFlowLayout.swift
//  DaoSample
//
//  Created by xzh on 2021/2/9.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollDirection = .vertical
        configItemSpacing()
        configHeaderAndFooter()
    }
    /// 配置item的间距
    private func configItemSpacing() {
        /**
         垂直 此值表示连续行之间的最小间距。
         水平 此值表示连续列之间的最小间距。
         此间距不适用于页眉和第一行之间或最后一行与页脚之间的空间。此属性的默认值为10.0。
         */
        self.minimumLineSpacing = 20
        
        /**
         垂直 此值表示同一行中项目之间的最小间距。
         水平 此值表示同一列中项目之间的最小间距。 该间距用于计算一行中可以容纳多少个物品，但是在确定了物品数量之后，可以向上调整实际间距。
         此属性的默认值为10.0。 */
        self.minimumInteritemSpacing = 30
        
        /**
         cell 默认的大小
         默认大小值为（50.0，50.0）
         */
        self.itemSize = CGSize(width: 160, height: 100)
        
        /**
         预估cell的大小
         当单元动态调整其大小时，提供估计的单元大小可以改善收集视图的性能。 估计值使集合视图可以延迟一些计算以确定其内容的实际大小。 屏幕上未显示的单元格被认为是估计的高度。
         此属性的默认值为CGSizeZero。 将其设置为其他任何值，例如automaticSize，都会导致集合视图使用单元格的preferredLayoutAttributesFitting（_ :)方法查询每个单元格的实际大小。
         如果所有单元格的大小都相同，请使用itemSize属性（而不是此属性）来指定单元格大小。
         */
//        estimatedItemSize = CGSize(width: 100, height: 100)
        
        /**
         组的内边距
         */
        sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        
        sectionInsetReference = .fromContentInset
    }
    
    /// 配置头视图和脚视图
    private func configHeaderAndFooter() {
        // 头视图的大小 垂直height生效 水平width生效
        headerReferenceSize = CGSize(width: 10, height: 40)
        // 脚视图的大小
        footerReferenceSize = CGSize(width: 10, height: 20)
        
        // 是否固定组头
        sectionHeadersPinToVisibleBounds = true
        // 是否固定组尾
        sectionFootersPinToVisibleBounds = true
    }
}
