//
//  NVActivityIndicatorController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/8/26.
//

import UIKit
import NVActivityIndicatorView
class NVActivityIndicatorController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let indicator = NVActivityIndicatorView(frame: CGRect(x: 100, y: 200, width: 50, height: 50), type: .ballGridPulse, color: UIColor.random, padding: 0);
        self.view.addSubview(indicator)
        indicator.startAnimating()
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
