//
//  ViewController.swift
//  DaoSample
//
//  Created by MoYing on 2020/11/14.
//

import UIKit

class DSData {
    var title: String
    var detail: String
    var dsid: Int
    
    init(title: String, detail: String, dsid: Int) {
        self.title = title
        self.detail = detail
        self.dsid = dsid
    }
}

class ViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    
    var dataSource: [DSData] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.setNavigationBarPrefersLargeTitles(Enable: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.setNavigationBarPrefersLargeTitles(Enable: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.setNavigationBarPrefersLargeTitles(Enable: true)
        self.navigationController?.setNavigationBar(PrefersLargeTitlesEnable: true)
        self.setNavigationBarLargeTitleDisplay(Mode: .automatic)
        self.navigationController?.setNavigationBar(BackgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        self.dataSource.append(DSData(title: "SearchController", detail: "搜索控制器", dsid: 0))
        self.dataSource.append(DSData(title: "CollectionController", detail: "网格控制器", dsid: 1))
        self.dataSource.append(DSData(title: "PanModalSample", detail: "PanModal库", dsid: 2))
        self.title = "DaoSample iOS 11+"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = dataSource[indexPath.row].title
        cell.detailTextLabel?.text = dataSource[indexPath.row].detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if dataSource[indexPath.row].dsid == 0 {
            self.navigationController?.pushViewController(TableViewController())
        }else if dataSource[indexPath.row].dsid == 1{
            self.navigationController?.pushViewController(CollectionViewController(nibName: "CollectionViewController", bundle: Bundle.main))
        }else if dataSource[indexPath.row].dsid == 2 {
            presentPanModal(PanModalController())
        }
    }
}
