//
//  TableVM.swift
//  DaoSample
//
//  Created by CaiGou on 2021/10/19.
//
import RxSwift
import RxCocoa
import Foundation
struct TableVM {
    let data = Observable.just([TableFeature(name: "分割线", id: 0),
                                TableFeature(name: "单选", id: 1)])
    func bindDataSource(view: UITableView, disposeBag: DisposeBag) {
        data.bind(to: view.rx.items){(tableView, indexPath, model) in
            let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
            
            return cell
        }.disposed(by: disposeBag)
    }
}
