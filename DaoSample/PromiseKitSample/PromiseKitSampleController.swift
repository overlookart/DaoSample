//
//  PromiseKitSampleController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/8/20.
//

import UIKit
import PromiseKit
class PromiseKitSampleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        firstly {
            after(seconds: 10)
        }.done {
            print("10 秒后")
        }
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
