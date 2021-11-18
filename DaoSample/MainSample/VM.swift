//
//  VM.swift
//  DaoSample
//
//  Created by CaiGou on 2021/8/27.
//

import Foundation
import RxSwift
import RxCocoa
import SideMenu
class VM {
    //可监听序列
    let data = Observable.just([Model(title: "SearchController", detail: "搜索控制器", dsid: 0),
                                Model(title: "CollectionController", detail: "网格控制器", dsid: 1),
                                Model(title: "PanModalSample", detail: "PanModal库", dsid: 2),
                                Model(title: "XCGLoggerSample", detail: "XCGLogger库", dsid: 3),
                                Model(title: "TransformSample", detail: "Transform", dsid: 4),
                                Model(title: "DeviceKitSample", detail: "DeviceKit", dsid: 5),
                                Model(title: "PromiseKitSample", detail: "PromiseKit", dsid: 6),
                                Model(title: "NVActivityIndicator", detail: "NVActivityIndicator", dsid: 7),
                                Model(title: "GCDWebServer", detail: "GCDWebServer", dsid: 8),
                                Model(title: "Transform3D", detail: "Transform3D", dsid: 9)])
    
    /// 绑定数据源
    /// - Parameters:
    ///   - view: tableView
    ///   - disposeBag: 回收器
    func bindDataSource(view: UITableView, disposeBag: DisposeBag) {
        data.bind(to: view.rx.items){(tableView, indexPath, model) in
            let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
            cell.textLabel?.text = model.title
            cell.detailTextLabel?.text = model.detail
            return cell
        }.disposed(by: disposeBag)
        
        

    }
}

class DaoRx {
    // Observable<Any>: 可监听序列   可产生事件
    // Observer 观察者
    // subscribe 将事件分类
    // Disposables 回收者
    let disposeBag: DisposeBag = DisposeBag()
    //创建序列
    let numObservable = Observable<Int>.create { observable -> Disposable in
        // 产生一个元素
        observable.onNext(0)
        observable.onNext(9)
        //元素全部产生完成
        observable.onCompleted()
        return Disposables.create()
    }
    let numObserver :AnyObserver<Int> = AnyObserver { event in
        switch event {
        case .next(let num):
            print(num)
        case .completed:
            print("完成")
        case .error(let err):
            print(err)
        }
    }
    func subscribeObservable(hasObserver: Bool) {
        if hasObserver {
            _ = numObservable.subscribe(numObserver).disposed(by: disposeBag)
        }else{
            _ = numObservable.subscribe { num in
                //onNext 事件
                print(num)
            } onError: { err in
                //onError 事件
                
            } onCompleted: {
                //onCompleted 事件
                print("完成")
            } onDisposed: {
                //onDisposed 事件
                print("回收")
            }.disposed(by: disposeBag)
        }
    }
    
    // Single 序列 只产生一个元素或一个错误
    //一个比较常见的例子就是执行 HTTP 请求，然后返回一个应答或错误。不过你也可以用 Single 来描述任何只有一个元素的序列
    let singleObservable = Single<Int>.create { single in
        
        single(.success(1))
        single(.success(9))
        let err = NSError()
        single(.failure(err))
        
        return Disposables.create()
    }
    func singleSubscribe() {
        _ = singleObservable.subscribe(onSuccess: { num in
            print("Single \(num)")
        }, onFailure: { err in
            print("Single 失败")
        }, onDisposed: {
            print("Single 回收")
        }).disposed(by: disposeBag)
    }
    
    //Completable 序列 只产生一个 completed 事件 或者一个 error 事件
    //适用于那种你只关心任务是否完成，而不需要在意任务返回值的情况
    let completableObservable = Completable.create { completable in
        completable(.completed)
        let err = NSError()
        completable(.error(err))
        return Disposables.create()
    }
    func completableSubscribe() {
        _ = completableObservable.subscribe(onCompleted: {
            print("Completable 完成")
        }, onError: { err in
            print("Completable 错误")
        }, onDisposed: {
            print("Completable 回收")
        }).disposed(by: disposeBag)
    }
    
    //Maybe 要么只能产生一个 success 事件，要么产生一个 completed 事件，要么产生一个 error 事件
    //如果你遇到那种可能需要发出一个元素，又可能不需要发出时，就可以使用 Maybe
    let maybeObservable = Maybe<Int>.create { maybe in
        maybe(.success(1))
        maybe(.success(9))
        maybe(.completed)
        maybe(.error(NSError()))
        return Disposables.create()
    }
    func maybeSubscribe() {
        _ = maybeObservable.subscribe(onSuccess: { num in
            print("Maybe 成功\(num)")
        }, onError: { err in
            print("Maybe 错误")
        }, onCompleted: {
            print("Maybe 完成")
        }, onDisposed: {
            print("Maybe 回收")
        }).disposed(by: disposeBag)
    }
    
    //Driver 简化 UI 层 不会产生 error 事件
    //一定在 MainScheduler 监听（主线程监听）
    //Driver 会对新观察者回放（重新发送）上一个元素
    
    //Signal 简化 UI 层 不会产生 error 事件
    //一定在 MainScheduler 监听（主线程监听）
    //Signal 不会对新观察者回放上一个元素。
    
    //ControlEvent 专门用于描述 UI 控件所产生的事件
    //不会产生 error 事件
    //一定在 MainScheduler 订阅（主线程订阅）
    //一定在 MainScheduler 监听（主线程监听）
    
}
