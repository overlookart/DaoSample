//
//  TransformSampleController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/27.
//

import UIKit

class TransformSampleController: BaseViewController {
    @IBOutlet weak var transformImgView: UIImageView!
    @IBOutlet weak var scaleXSlider: UISlider!
    @IBOutlet weak var scaleYSlider: UISlider!
    @IBOutlet weak var moveXSlider: UISlider!
    @IBOutlet weak var moveYSlider: UISlider!
    @IBOutlet weak var rotateXSlider: UISlider!
    @IBOutlet weak var rotateYSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /**
         tx:水平位移 ty:垂直位移
          a:水平缩放 d:垂直缩放
          b:水平旋转 c:垂直旋转
         */
        transformLog()
        
    }

    @IBAction func scaleByXChanged(_ sender: Any) {
        if let slider = sender as? UISlider {
            transformImgView.transform.a = CGFloat(slider.value)
            transformLog()
        }
    }
    @IBAction func scaleByYChanged(_ sender: Any) {
        if let slider = sender as? UISlider {
            transformImgView.transform.d = CGFloat(slider.value)
            transformLog()
        }
    }
    @IBAction func moveByXChanged(_ sender: Any) {
        if let slider = sender as? UISlider {
            transformImgView.transform.tx = CGFloat(slider.value)
            transformLog()
        }
    }
    @IBAction func moveByYChanged(_ sender: Any) {
        if let slider = sender as? UISlider {
            transformImgView.transform.ty = CGFloat(slider.value)
            transformLog()
        }
    }
    @IBAction func rotateByXChanged(_ sender: Any) {
        if let slider = sender as? UISlider {
            transformImgView.transform.b = CGFloat(slider.value)
            transformLog()
        }
        
    }
    @IBAction func rotateByYChanged(_ sender: Any) {
        if let slider = sender as? UISlider {
            transformImgView.transform.c = CGFloat(slider.value)
            transformLog()
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

extension TransformSampleController {
    func transformLog() {
        let transform = transformImgView.transform
        print("\(transform.isIdentity)")
        print(" a:\(transform.a), b:\(transform.b),0")
        print(" c:\(transform.c), d:\(transform.d),0")
        print("tx:\(transform.tx),ty:\(transform.ty),1")
    }
}
