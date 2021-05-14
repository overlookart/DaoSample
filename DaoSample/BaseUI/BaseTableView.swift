//
//  BaseTableView.swift
//  DaoSample
//
//  Created by CaiGou on 2021/5/14.
//

import UIKit

class BaseTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    /*
     1.初始化时 指定 foot view 来去除多余的分割线
     2.separator 分割线的左右间距为0
     */
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.makeDefaultUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeDefaultUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// UI的默认配置
    private func makeDefaultUI() {
        self.tableFooterView = UIView()
        self.separatorInset = UIEdgeInsets.zero
    }
}
