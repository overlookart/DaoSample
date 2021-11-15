//
//  GCDServerController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/11/8.
//

import UIKit
import GCDWebServer
class GCDServerController: UIViewController {
    
    let webServer: GCDWebServer = GCDWebServer()
    @IBOutlet weak var startServerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.webServer.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self) { request in
            return GCDWebServerDataResponse.init(html: "<html><body><p>Hello World</p></body></html>")
        }
    }
    @IBAction func startServerAction(_ sender: Any) {
        self.webServer.start(withPort: 8088, bonjourName: nil)
        print("Visit \(String(describing: self.webServer.serverURL)) in your web browser")
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
