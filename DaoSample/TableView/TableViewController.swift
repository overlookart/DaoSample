//
//  TableViewController.swift
//  DaoSample
//
//  Created by xzh on 2021/1/18.
//

import UIKit
import CoreData
class TableViewController: UITableViewController {
    
    var dataSource: [BiologyLevel] = []
    
    let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: ResultsTableController())
        return search
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
//        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        self.navigationItem.rightBarButtonItems?.append(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction)))
        searchController.searchBar.prompt = "abc"
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
        
        
        if let resultsController = self.searchController.searchResultsController as? ResultsTableController {
            self.searchController.delegate = resultsController
            self.searchController.searchResultsUpdater = resultsController
        }
        
        
        self.navigationController?.setNavigationBar(TintColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
//        self.navigationController?.navigationBar.barStyle = .black
//        self.title = "TableView"
        //http://abp.alookbrowser.com/alook/zh.zip
        
//        self.setNavigationBarLargeTitleDisplay(Mode: .never)
        if #available(iOS 14.0, *) {
            self.navigationItem.backButtonDisplayMode = .generic
        }
        
        self.tableView.register(cellWithClass: UITableViewCell.self)
        self.tableView.register(headerFooterViewClassWith: THeaderView.self)
        //在未处于编辑模式时是否可以选择行
        self.tableView.allowsSelection = false
        //在编辑模式下是否可以选择行
        self.tableView.allowsSelectionDuringEditing = false
        //是否可同时选择多行
        self.tableView.allowsMultipleSelection = true
        //在编辑模式下是否可同时选择多行
        self.tableView.allowsMultipleSelectionDuringEditing = true
        //设置cell的分割线
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorColor = UIColor.random
        self.tableView.separatorEffect = UIVisualEffect()
        
        requestData()
    }
    
    func requestData() {
         let r = CoreData.share.findBiologyLevels()
         for b in r {
            print(b.name)
            print(b.levels)
        }
        self.dataSource = r
    }
    
    @objc func addAction() {
        self.tableView.setEditing(false, animated: true)
        let alert = UIAlertController(title: "添加一种生物泛型", message: nil, preferredStyle: .alert)
        alert.addAction(title: "确定", style: .default, isEnabled: true) { (action) in
            if let tf = alert.textFields, tf.count > 0 ,let ff = tf.first, let text = ff.text {
                self.addBiologyLevel(levelName: text)
            }
        }
        alert.addAction(title: "取消", style: .cancel, isEnabled: true, handler: nil)
        alert.addTextField(text: nil, placeholder: "等级名称", editingChangedTarget: self, editingChangedSelector: #selector(editingChanged))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func editingChanged() {
        
    }
}


// MARK: 数据操作

extension TableViewController {
    /// 添加生物等级
    /// - Parameter levelName: 等级名称
    private func addBiologyLevel(levelName: String) {
        if levelName.isEmpty {
            //提示信息
            return;
        }
        let bl = CoreData.share.addBiologyLevel(name: levelName);
        self.dataSource.append(bl)
        self.tableView.insertSections(IndexSet(integer: self.dataSource.count-1), with: .left)
    }
    
    private func addBiologyClass(className: String, index: Int) {
        let b = BiologyKingdom(context: CoreData.share.persistentContainer.viewContext)
        b.name = className
        dataSource[index].addToLevels(b)
        CoreData.share.save()
        self.tableView.insertRows(at: [IndexPath(row: 0, section: index)], with: .right)
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension TableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource[section].levels?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self, for: indexPath)
        cell.textLabel?.text = (dataSource[indexPath.section].levels?.allObjects[indexPath.row] as! BiologyKingdom).name
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].name
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withClass: THeaderView.self)
        view.addAction = {
            let addName = self.dataSource[section].name ?? ""
            
            let alert = UIAlertController(title: "添加一种\(addName)类", message: nil, preferredStyle: .alert)
            alert.addAction(title: "确定", style: .default, isEnabled: true) { (action) in
                if let tf = alert.textFields, tf.count > 0 ,let ff = tf.first, let text = ff.text, !text.isEmpty {
                    self.addBiologyClass(className: text, index: section)
                }
            }
            alert.addAction(title: "取消", style: .cancel, isEnabled: true, handler: nil)
            alert.addTextField(text: nil, placeholder: "等级名称", editingChangedTarget: nil, editingChangedSelector: nil)
            
            self.present(alert, animated: true, completion: nil)
        }
        return view
    }
}

// MARK: - Cell Edit
extension TableViewController {
    // 是否可以编辑
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let cellAction1 = UITableViewRowAction(style: .default, title: "删除") { (action, index) in
            if let bk = self.dataSource[indexPath.section].levels?.allObjects[indexPath.row] as? BiologyKingdom {
                self.dataSource[indexPath.section].removeFromLevels(bk)
                CoreData.share.save()
                tableView.deleteRows(at: [indexPath], with: .left)
            }
        }
        
        return [cellAction1]
    }
    
    // 编辑模式下左侧样式
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 删除数据源
//            self.dataSource[indexPath.section].remove(at: indexPath.row)
            // 删除单元格
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // 插入数据源
//            dataSource[indexPath.section].insert(1, at: indexPath.row)
            // 插入单元格
            tableView.insertRows(at: [indexPath], with: .right)
        }
    }
    
    /// 从左侧滑出 将覆盖editActionsForRowAt方法
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "左滑") { (action, view, handler) in
            handler(true)
        }
        action.backgroundColor = UIColor.random
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    /// 从右侧滑出
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "右滑") { (action, view, handler) in
            handler(true)
        }
        action.backgroundColor = UIColor.random
        return UISwipeActionsConfiguration(actions: [action])
    }
}

// MARK: - Cell Move
extension TableViewController {
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // 是否可以排序
        return true
    }
    

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        print("Cell移动___from(\(fromIndexPath.section):\(fromIndexPath.row))___to(\(to.section):\(to.row))")
        if fromIndexPath == to {
            return
        }
        // 交换数据源
//        let data = dataSource[fromIndexPath.section][fromIndexPath.row]
//        dataSource[fromIndexPath.section].remove(at: fromIndexPath.row)
//        dataSource[to.section].insert(data, at: to.row)
        
    }
    
    //拖拽某行到一个目标上方时触发该方法，询问是否移动或者修正
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            var row = 0
            //如果是往下面的分区拖动，则回到原分区末尾
            //如果是往上面的分区拖动，则会到原分区开头位置
            if sourceIndexPath.section < proposedDestinationIndexPath.section {
                row = tableView.numberOfRows(inSection: sourceIndexPath.section)-1
            }
            return IndexPath(row: row, section: sourceIndexPath.section)
        }
        return proposedDestinationIndexPath
    }
}

// MARK:- 用两个手指的手势选择多个项目
extension TableViewController {
    /// 是否支持多选手势
    override func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        true
    }
    
    /// 开始多选手势
    override func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        self.setEditing(true, animated: true)
    }
    
    /// 结束多选手势
    override func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
        
    }
}
