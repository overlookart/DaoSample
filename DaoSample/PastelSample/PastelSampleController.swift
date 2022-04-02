//
//  PastelSampleController.swift
//  DaoSample
//
//  Created by CaiGou on 2022/4/2.
//

import UIKit
#if canImport(Pastel)
import Pastel
#endif

#if canImport(SnapKit)
import SnapKit
#endif
class PastelSampleController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let v = PastelView(frame: .zero)
        v.setColors([UIColor.random, UIColor.random, UIColor.random])
        v.startAnimation()
        view.addSubview(v)
        #if canImport(SnapKit)
        v.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        #endif
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
