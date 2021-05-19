//
//  XCGLoggerController.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/18.
//

import UIKit
import XCGLogger
class XCGLoggerController: BaseViewController {

    let log = XCGLogger.default
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configLog()
    }
    private func configLog() {
        log.setup(level: .none, showLogIdentifier: true, showFunctionName: true, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, showDate: true, writeToFile: nil, fileLevel: nil)
    }
    @IBAction func verboseBtnAction(_ sender: Any) {
        log.outputLevel = .verbose
        log.verbose("详细信息，通常在处理特定问题时很有用")
    }
    @IBAction func debugBtnAction(_ sender: Any) {
        log.outputLevel = .debug
        log.debug("一个 debug 信息")
    }
    @IBAction func infoBtnAction(_ sender: Any) {
        log.outputLevel = .info
        log.info("一条info消息，可能有助于提高用户在console.app中的查找")
    }
    @IBAction func noticeBtnAction(_ sender: Any) {
        log.outputLevel = .notice
        log.notice("一个 notice 信息")
    }
    @IBAction func warningBtnAction(_ sender: Any) {
        log.outputLevel = .warning
        log.warning("警告消息，可能指示可能的错误")
    }
    @IBAction func errorBtnAction(_ sender: Any) {
        log.outputLevel = .error
        log.error("发生错误，但是可以恢复，只是发生了什么的信息")
    }
    @IBAction func severeBtnAction(_ sender: Any) {
        log.outputLevel = .severe
        log.severe("发生了严重错误，我们现在可能会崩溃")
    }
    @IBAction func alertBtnAction(_ sender: Any) {
        log.outputLevel = .alert
        log.alert("发生警报错误，可以将日志目标发送给某人")
    }
    @IBAction func emergencyBtnAction(_ sender: Any) {
        log.outputLevel = .emergency
        log.emergency("发生紧急错误，可以将日志目标发送给某人")
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
