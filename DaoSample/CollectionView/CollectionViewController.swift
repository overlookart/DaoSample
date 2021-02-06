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

        // Register cell classes
        self.collectionView.register(nibWithCellClass: CollectionViewCell.self)
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

    // MARK:- UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CollectionViewCell.self, for: indexPath)
    
        // Configure the cell
        return cell
    }

    // MARK:- UICollectionViewDelegate
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
    
    /// item 将要显示
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        
    }

    
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



