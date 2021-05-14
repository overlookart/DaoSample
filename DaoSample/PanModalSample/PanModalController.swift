//
//  PanModalController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/14.
//

import UIKit
import PanModal
class PanModalController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PanModal"
        // Do any additional setup after loading the view.
        
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

extension PanModalController: PanModalPresentable{
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(40)
    }
}
