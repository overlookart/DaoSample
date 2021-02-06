//
//  THeaderView.swift
//  DaoSample
//
//  Created by xzh on 2021/2/5.
//

import UIKit
import SnapKit
class THeaderView: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let addBtn: UIButton = {
        let btn = UIButton(type: .contactAdd)
        return btn
    }()
    
    var addAction: (() -> Void)?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.contentView.addSubview(self.addBtn)
        addBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.right.equalTo(-10)
            make.centerY.equalTo(self.contentView)
        }
        addBtn.addTarget(self, action: #selector(addBtnAction), for: .touchUpInside)
    }
    
    
    @objc private func addBtnAction() {
        if self.addAction != nil {
            self.addAction!()
        }
    }
}
