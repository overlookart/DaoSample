//
//  CollectionViewCell.swift
//  DaoSample
//
//  Created by xzh on 2021/2/6.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = UIColor.cyan
        self.setBackgroundView()
    }
}

// MARK:- Changing the Appearance of Selected and Highlighted Cells
/**
 更改选定和突出显示的单元格的外观
 向用户提供有关单元状态以及状态之间转换的视觉反馈
 该示例应用程序显示了如何在未选择，突出显示和选择状态之间转换时更改集合视图单元格的外观。 当用户点击一个单元格时，该应用会确定该单元格的状态，并更改该单元格的外观以指示状态之间的转换。
 
 此示例中的集合视图支持单项选择，这是集合视图的默认选择。 您还可以配置集合视图以支持多项目选择，或完全禁用选择。
 */

/**
 确定单元格的状态
 
 此样本中的收集视图通过检测其范围内的点击来确定单元的状态。 然后，它设置相应单元格的isSelected和isHighlighted属性以指示当前状态。 收集视图提供了此行为，因为其allowSelection属性设置为true。
 
 触摸未选择的单元格时，初始触地事件将导致集合视图将单元格的isHighlighted属性更改为true。 最终的修饰事件使突出显示的状态返回到false。 如果在单元格内部发生了触摸事件，则收集视图会将单元格的isSelected属性设置为true； 否则，属性值保持不变。
 */

/**
 改变单元格的外观
 
 单元格的backgroundView属性引用该视图，以便在首次加载时以及未突出显示或未选中它时显示为单元格的背景。 当单元格的状态更改为突出显示或选中时，集合视图将修改单元格的属性以指示新状态。 但是，它不会自动更改单元格的外观。 也就是说，除非您将单元格的selectedBackgroundView属性设置为视图。
 
 将selectedBackgroundView设置为视图会导致集合视图在突出显示或选择单元格时将默认背景替换为所选背景。 您的应用无需执行其他任何操作。 集合视图会随着单元格状态的变化而自动更改单元格的外观。 例如，示例应用在选择单元格时使用selectedBackgroundView属性将单元格的背景颜色从红色更改为蓝色。
 */
extension CollectionViewCell {
    private func setBackgroundView() {
        let redView = UIView(frame: self.bounds)
        redView.backgroundColor = UIColor.red
        self.backgroundView = redView
        
        let blueView = UIView(frame: bounds)
        blueView.backgroundColor = UIColor.blue
        self.selectedBackgroundView = blueView
    }
    
    func highlight() {
        self.contentView.backgroundColor = nil
    }
    
    func unHighlight() {
        self.contentView.backgroundColor = UIColor.cyan
    }
    
    func didSelect() {
        self.contentView.backgroundColor = nil
    }
    
    func didDeselect() {
        self.contentView.backgroundColor = UIColor.cyan
    }
}


// MARK: - Selecting Multiple Items with a Two-Finger Pan Gesture
/**
 用两个手指的手势选择多个项目
 使用表格和集合视图上的多选手势，加快用户对多个项目的选择。
 
 在iOS13和更高版本中，您可以为应用程序的用户提供在表视图和集合视图上使用两指平移手势选择多个项目的功能。 启用此功能的应用使用户可以快速选择多个项目。 例如，当表格视图识别出两指平移手势时，应用程序可以自动将表格视图置于编辑模式，而用户无需点击“编辑”或“选择”按钮。
 要选择多个项目，请将两根手指拖到要选择的项目上。 当视图识别到两个手指的平移手势时，它将更改为编辑模式，从而可以选择多个项目。
 
 所选项目不必是连续的。 用两根手指选择一些项目，滚动视图，然后再次用两根手指选择更多项目。 您也可以使用相同的两指平移手势取消选择多个项目。 只需在选择的项目上拖动两个手指，表格和集合视图都将取消选择项目。
 此示例向您展示如何在您的应用中支持此功能。 该示例应用程序显示一个表格视图和一个集合视图。 当示例在iPad上运行时，该应用程序会使用唾液视图并排显示两个视图。 在iPhone上运行该应用程序时，该应用程序显示一个选项卡栏，可让您在表格视图和集合视图之间切换。
 */
extension CollectionViewCell {
    
}
