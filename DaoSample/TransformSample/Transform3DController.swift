//
//  Transform3DController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/28.
//

import UIKit

class Transform3DController: BaseViewController {
    private var currentBtnTag = 0
    @IBOutlet weak var currentBtnTagLab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func transformBtnAction(_ sender: Any) {
        if let btn = sender as? UIButton {
            self.currentBtnTag = btn.tag
            self.currentBtnTagLab.text = "\(self.currentBtnTag)"
        }
    }
    
    private func updateTransformBtnState(){
        
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
