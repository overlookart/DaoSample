//
//  CollectionViewController.swift
//  DaoSample
//
//  Created by xzh on 2021/2/6.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        registerCellAndSupplementaryView()
        
        // 是否可以选中cell
        self.collectionView.allowsSelection = true
        // 是否可以多选cell
        self.collectionView.allowsMultipleSelection = true
        if #available(iOS 14.0, *) {
            // 在编辑模式下是否可以选中cell
            self.collectionView.allowsSelectionDuringEditing = true
            // 在编辑模式下是否可以多选cell
            self.collectionView.allowsMultipleSelectionDuringEditing = true
        }
        self.title = "Collection"

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    
    private func registerCellAndSupplementaryView() {
        // 注册单元格
        self.collectionView.register(nibWithCellClass: CollectionViewCell.self)
        // 注册组头/脚试图
        self.collectionView.register(supplementaryViewOfKind: "supplementary", withClass: SupplementaryView.self)
    }
    
}

// MARK: - UICollectionViewDataSource
/**
 用于管理数据并为CollectionView提供cell的对象所采用的方法。
 */
extension CollectionViewController {
    
    /// 数据源中组的数量
    /// - Parameter collectionView
    /// - Returns: 组的数量
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    /// 指定部分item的数量
    /// - Parameters:
    ///   - collectionView
    ///   - section: 标识collectionView中的组的索引号。 该索引值从0开始
    /// - Returns: 部分中的item数
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    /// 返回指定的cell
    /// - Parameters:
    ///   - collectionView
    ///   - indexPath: item的索引
    /// - Returns: 已配置的单元格对象 您不得从此方法返回nil
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CollectionViewCell.self, for: indexPath)
    
        // Configure the cell
        return cell
    }
    
    /// 每组头/脚视图。
    /// - Parameters:
    ///   - collectionView
    ///   - kind: 头/脚试图的类型
    ///   - indexPath: 头/脚试图的索引
    /// - Returns: 配置的头/脚视图对象。 您不得从此方法返回nil。
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: "supplementary", withClass: SupplementaryView.self, for: indexPath)
        supplementaryView.backgroundColor = UIColor.random
        print(kind)
        return supplementaryView
    }
    
    
    /// item 是否可以移动
    /// - Parameters:
    ///   - collectionView
    ///   - indexPath: item 的索引
    /// - Returns: 如果允许移动item，则为true；否则，则为false。
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /// 移动 item
    /// - Parameters:
    ///   - collectionView:
    ///   - sourceIndexPath: item 的原始索引
    ///   - destinationIndexPath: item 的新索引
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // 更新数据源
    }
    
    /// 要求数据源返回索引项的标题以显示在collectionView中
    /// - Parameter collectionView
    /// - Returns: 字符串数组，用于每个索引条目的标题。 例如，您可能返回一个包含字母的字符串数组（[“ A”，“ B”，“ C”，...，“ Z”])
    override func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return ["A"]
    }
    
    /// 要求数据源返回与您的一个索引条目相对应的集合视图项的索引路径
    /// - Parameters:
    ///   - collectionView
    ///   - title: 索引项目的标题。 此字符串对应于您在indexTitles（for :)方法中返回的字符串之一。
    ///   - index: 由indexTitles（for :)方法返回的数组索引，该索引与索引标题相对应。
    /// - Returns: 用户选择索引时应显示的集合视图项的索引路径
    override func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        return IndexPath(item: 0, section: index)
    }
}


// MARK: - UICollectionViewDelegate
// MARK:- 高亮与选择状态
extension CollectionViewController {
    /// item 是否可以高亮显示 (when the touch begins)
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    /// item 高亮显示 (when the touch begins)
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("item 高亮显示")
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.highlight()
        }
    }

    /// item 取消高亮显示 (when the touch lifts)
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("item 取消高亮显示")
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.unHighlight()
        }
    }
    
    /// item 是否可以被选中 (when the touch lifts)
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /// item 是否可以被取消选中 (when the touch lifts) 当用户在多选模式下点击已选择的项目时调用
    override func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /// 选中了某个 item (when the touch lifts)
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("选中了某个 item")
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.didSelect()
        }
    }
    /// 取消选中某个 item (when the touch lifts)
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("取消选中某个 item")
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.didDeselect()
        }
    }
}

// MARK:- 用两个手指的手势选择多个项目
extension CollectionViewController {
    /// 是否支持多选手势
    override func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        true
    }
    /// 开始多选手势
    override func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        self.setEditing(true, animated: true)
    }
    /// 结束多选手势
    override func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView) {
        
    }
}

// MARK:- item 的添加与删除
extension CollectionViewController {
    /// 添加的item 将要显示
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    /// 头/脚试图将要显示
    /// - Parameters:
    ///   - collectionView: 头/脚视图的集合视图对象。
    ///   - view: 正在添加的视图
    ///   - elementKind: 头/脚视图的类型。 该字符串由呈现视图的布局定义。
    ///   - indexPath: 头/脚视图数据项的索引路径。
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        
    }
    
    /// 指定的cell已经移除
    /// - Parameters:
    ///   - collectionView: 移除cell的collectionView
    ///   - cell: 被移除的cell
    ///   - indexPath: cell的数据项的索引路径。
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    /// 头/脚试图已经移除
    /// - Parameters:
    ///   - collectionView: 移除附加试图的collectionView
    ///   - view: 被移除的试图
    ///   - elementKind: 头/脚试图的类型
    ///   - indexPath: 头/脚视图数据项的索引路径。
    override func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        
    }
}

// MARK:- 处理布局更改
extension CollectionViewController {
    
    /// 要求在指定布局之间移动时使用自定义过渡布局。
    /// - Parameters:
    ///   - collectionView: 其布局对象正在更改的集合视图。
    ///   - fromLayout: 集合视图的当前布局。 这是过渡的起点。
    ///   - toLayout: 集合视图的新布局。
    /// - Returns: 用于执行过渡的集合视图过渡布局对象。
    override func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        
        return UICollectionViewTransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
    }
    
    /// 使代理有机会为布局更改和动画更新自定义内容偏移。
    /// - Parameters:
    ///   - collectionView: 发出请求的集合视图。
    ///   - proposedContentOffset: 可见内容左上角的建议点（在集合视图的内容视图的坐标空间中）。 这表示收集视图已计算为最可能用于动画或布局更新的值。
    /// - Returns: 您要改用的内容偏移量。 如果未实现此方法，则收集视图将使用proposalContentOffset参数中的值。
    override func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return proposedContentOffset
    }
    
    /// 要求代理提供在移动项目时要使用的索引路径。
    /// - Parameters:
    ///   - collectionView: 发出请求的集合视图。
    ///   - originalIndexPath: item 的原始索引路径。
    ///   - proposedIndexPath: 建议的item索引路径。
    /// - Returns: 您要用于该项目的索引路径。 如果未实现此方法，则收集视图将使用proposalIndexPath参数中的索引路径。
    override func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        return proposedIndexPath
    }
}

// MARK:- 管理上下文菜单 Managing Context Menus
@available(iOS 13.0, *)
extension CollectionViewController {
    
    /// 返回item在某个点的上下文菜单配置。
    /// - Parameters:
    ///   - collectionView: 包含item的集合视图
    ///   - indexPath: 为其请求配置的item的索引路径
    ///   - point: 交互在集合视图的坐标空间中的位置
    /// - Returns: 描述要显示的菜单的上下文菜单配置对象 返回nil阻止交互开始。 返回空的配置对象将导致交互开始，然后以取消效果结束
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let action1 = UIAction(title: "Action1", image: nil, identifier: .none, discoverabilityTitle: nil, attributes: .destructive, state: .mixed) { (action) in
            
        }
        let action2 = UIAction(title: "Action2", image: nil, identifier: .none, discoverabilityTitle: nil, attributes: .destructive, state: .on) { (action) in
            
        }
        let contextMenu = UIContextMenuConfiguration(identifier: nil) { () -> UIViewController? in
            return TableViewController()
        } actionProvider: { (elements) -> UIMenu? in
            return UIMenu(title: "ac", image: nil, identifier: .about, options: .destructive, children: [action1,action2])
        }

        return contextMenu
    }
    
    
    /// 关闭上下文菜单时返回目标视图。
    /// - Parameters:
    ///   - collectionView: 请求此信息的集合视图对象
    ///   - configuration: 显示的菜单配置
    /// - Returns: 一个定向的预览对象，描述了解雇预览 交互使呈现的菜单动画化为预览。 使用此方法来自定义解雇动画
    
    override func collectionView(_ collectionView: UICollectionView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        view.backgroundColor = UIColor.random
        
        return nil
    }
    
    /// 返回一个视图以覆盖默认的预览（创建的集合视图）
    /// - Parameters:
    ///   - collectionView: 请求此信息的集合视图对象
    ///   - configuration: 菜单的配置突出显示
    /// - Returns: 一个定向的预览对象，用于描述突出显示预览
    override func collectionView(_ collectionView: UICollectionView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        view.backgroundColor = UIColor.random
//        UITargetedPreview(view: view)
        return nil
    }
    
    /// 在上下文菜单出现时通知委托
    /// - Parameters:
    ///   - collectionView: 通知此事件的委托的集合视图
    ///   - configuration: 要显示的菜单配置
    ///   - animator: 动画与外观过渡同时运行
    override func collectionView(_ collectionView: UICollectionView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        
    }
    
    /// 在上下文菜单消失时通知委托。
    /// - Parameters:
    ///   - collectionView: 通知此事件的委托的集合视图
    ///   - configuration: 结束配置
    ///   - animator: 动画与消失过渡一起运行
    override func collectionView(_ collectionView: UICollectionView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        
    }
    
    /// 当用户通过点击预览触发提交时通知委托。
    /// - Parameters:
    ///   - collectionView: 通知此事件的委托的集合视图
    ///   - configuration: 显示的菜单配置
    ///   - animator: 动画与提交过渡一起运行
    override func collectionView(_ collectionView: UICollectionView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        
    }
}

// MARK:- 在集合视图中管理焦点 Managing Focus in a Collection View
extension CollectionViewController {
    
    /// 询问代理是否可以集中指定索引路径的项目。
    /// - Parameters:
    ///   - collectionView: 请求此信息的集合视图对象
    ///   - indexPath: 集合视图中项目的索引路径
    /// - Returns: 如果该item可以集中注意力，则返回true；否则，则返回false
    override func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /// 向代理询问应关注的单元格的索引路径。
    /// - Parameter collectionView: 请求此信息的集合视图对象
    /// - Returns: 首选单元格的索引路径。 您指定的索引路径必须对应于集合视图中的有效单元格。
    override func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        return nil
    }
    
    /// 询问代理是否应该改变焦点。
    /// - Parameters:
    ///   - collectionView: 请求此信息的集合视图对象
    ///   - context: 上下文对象包含与焦点更改关联的元数据。 该对象包含先前关注的项目的索引路径以及接下来要接收关注的项目。 使用此信息来确定是否应进行焦点更改
    /// - Returns: 如果应该进行焦点更改，则为true；否则，则为false。
    override func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        return true
    }
    
    /// 告诉代理发生焦点更新。
    /// - Parameters:
    ///   - collectionView: 集合视图对象将焦点更改 
    ///   - context: 上下文对象包含与焦点更改关联的元数据。 该对象包含先前关注的项目和当前关注的项目的索引路径。
    ///   - coordinator: 创建任何其他动画时要使用的动画协调器。
    override func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
    }
}

// MARK:- 编辑 item Editing Items
@available(iOS 14.0, *)
extension CollectionViewController {
    
    /// item 是否可编辑
    /// - Parameters:
    ///   - collectionView: 请求此信息的集合视图对象
    ///   - indexPath: 在集合视图中定位项目的索引路径
    /// - Returns: 如果该项是可编辑的，则返回true；否则，则返回false。 默认值是true。 
    override func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK:- 控制弹性加载行为 Controlling the Spring-Loading Behavior
extension CollectionViewController {
    
    /// item 是否显示弹性加载相互作用效果
    /// - Parameters:
    ///   - collectionView: 集合视图对象将通知您交互
    ///   - indexPath: 适用于弹性加载行为的项目的索引路径
    ///   - context: 一个上下文对象，包含有关项目和视图的信息，在该视图上显示弹簧加载交互
    /// - Returns: 如果为true，则对item应用弹性加载行为；如果为false，则完全抑制行为
    override func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return true
    }
}

// MARK:- 管理cell的动作 iOS 6 ~ iOS 13
extension CollectionViewController {
    /// 长按 展示复制/剪切/选择菜单
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    /// 复制/剪切/选择菜单生效
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }
    ///复制/剪切/选择菜单事件
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        print("performAction",action.description)
    }
}
