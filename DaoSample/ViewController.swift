//
//  ViewController.swift
//  DaoSample
//
//  Created by MoYing on 2020/11/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    
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
        self.navigationController?.setNavigationBar(BackgroundColor: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
        
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "SearchController"
        cell.detailTextLabel?.text = "搜索控制器"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(TableViewController())
    }
}
