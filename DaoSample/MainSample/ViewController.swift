//
//  ViewController.swift
//  DaoSample
//
//  Created by MoYing on 2020/11/14.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    let disposeBag = DisposeBag()
    let vm = VM()
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
        self.title = "DaoSample iOS 11+"
        
        
        //注册无nib的单元格
        self.mainTableView.register(cellWithClass: UITableViewCell.self)
        //绑定数据源
        vm.bindDataSource(view: self.mainTableView, disposeBag: disposeBag)
        self.mainTableView.rx.modelSelected(Model.self).subscribe(onNext: {model in
            if model.dsid == 0 {
                self.navigationController?.pushViewController(TableViewController())
            }else if model.dsid == 1 {
                self.navigationController?.pushViewController(CollectionViewController(nibName: "CollectionViewController", bundle: Bundle.main))
            }else if model.dsid == 2 {
                self.presentPanModal(PanModalController())
            }else if model.dsid == 3 {
                self.navigationController?.pushViewController(XCGLoggerController())
            }else if model.dsid == 4 {
                self.navigationController?.pushViewController(TransformSampleController())
            }else if model.dsid == 5 {
                self.navigationController?.pushViewController(DeviceKitSampleController())
            }else if model.dsid == 6 {
                self.navigationController?.pushViewController(PromiseKitSampleController())
            }else if model.dsid == 7 {
                self.navigationController?.pushViewController(NVActivityIndicatorController())
            }else if model.dsid == 8 {
                self.navigationController?.pushViewController(GCDServerController())
            }
        }).disposed(by: disposeBag)
        let daorx = DaoRx()
        daorx.subscribeObservable(hasObserver: true)
        daorx.singleSubscribe()
        daorx.completableSubscribe()
        daorx.maybeSubscribe()
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

extension ViewController{
   
}
