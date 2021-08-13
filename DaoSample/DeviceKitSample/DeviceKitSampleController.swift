//
//  DeviceKitSampleController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/8/13.
//

import UIKit
import DeviceKit
class DeviceKitSampleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let device = Device.current
        print(device)
        if device.isPod {
            print("Pod")
        }
        if device.isPhone {
            print("Phone")
        }
        if device.isPad {
            print("Pad")
        }
        if device.isSimulator {
            print("Simulator")
        }
        
        let groupOfAllowedDevices: [Device] = [.iPhone12, .simulator(.iPhone12ProMax)];
        if device.isOneOf(groupOfAllowedDevices) {
            print("合法设备")
        }

        //设备电池电量
        print("电池电量:",device.batteryLevel ?? 0)
        
        //低电量模式
        if let lowpower: Bool = device.batteryState?.lowPowerMode, lowpower {
            print("低电量模式")
        }
        
        //引导式访问
        if device.isGuidedAccessSessionActive {
            print("引导式访问")
        }
        
        //屏幕亮度
        print("屏幕亮度",device.screenBrightness)
        
        //可用磁盘空间
        print("可用磁盘空间",Device.volumeAvailableCapacityForOpportunisticUsage ?? 0)
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
