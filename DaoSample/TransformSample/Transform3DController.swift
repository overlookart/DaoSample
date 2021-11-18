//
//  Transform3DController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/28.
//

import UIKit

class Transform3DController: BaseViewController {
    private var currentBtn: UIButton?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var currentBtnTagLab: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func transformBtnAction(_ sender: Any) {
        if let btn = sender as? UIButton {
            btn.isSelected = true
            currentBtn = btn
            if currentBtn?.titleForNormal == "M11" {
                slider.value = Float(imgView.layer.transform.m11)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M12" {
                slider.value = Float(imgView.layer.transform.m12)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M13" {
                slider.value = Float(imgView.layer.transform.m13)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M14" {
                slider.value = Float(imgView.layer.transform.m14)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M21" {
                slider.value = Float(imgView.layer.transform.m21)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M22" {
                slider.value = Float(imgView.layer.transform.m22)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M23" {
                slider.value = Float(imgView.layer.transform.m23)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M24" {
                slider.value = Float(imgView.layer.transform.m24)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M31" {
                slider.value = Float(imgView.layer.transform.m31)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M32" {
                slider.value = Float(imgView.layer.transform.m32)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M33" {
                slider.value = Float(imgView.layer.transform.m33)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M34" {
                slider.value = Float(imgView.layer.transform.m34)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M41" {
                slider.value = Float(imgView.layer.transform.m41)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M42" {
                slider.value = Float(imgView.layer.transform.m42)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "43" {
                slider.value = Float(imgView.layer.transform.m43)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }else if currentBtn?.titleForNormal == "M44" {
                slider.value = Float(imgView.layer.transform.m44)
                currentBtnTagLab.text = String(format: "%f", slider.value)
            }
        }
    }
    
    @IBAction func sliderValueChangeAction(_ sender: Any) {
        if let slider = sender as? UISlider {
            currentBtnTagLab.text = String(format: "%f", slider.value)
            if currentBtn?.titleForNormal == "M11" {
                imgView.layer.transform.m11 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M12" {
                imgView.layer.transform.m12 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M13" {
                imgView.layer.transform.m13 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M14" {
                imgView.layer.transform.m14 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M21" {
                imgView.layer.transform.m21 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M22" {
                imgView.layer.transform.m22 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M23" {
                imgView.layer.transform.m23 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M24" {
                imgView.layer.transform.m24 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M31" {
                imgView.layer.transform.m31 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M32" {
                imgView.layer.transform.m32 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M33" {
                imgView.layer.transform.m33 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M34" {
                imgView.layer.transform.m34 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M41" {
                imgView.layer.transform.m41 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M42" {
                imgView.layer.transform.m42 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M43" {
                imgView.layer.transform.m43 = CGFloat(slider.value)
            }else if currentBtn?.titleForNormal == "M44" {
                imgView.layer.transform.m44 = CGFloat(slider.value)
            }
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
