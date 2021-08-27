//
//  Model.swift
//  DaoSample
//
//  Created by CaiGou on 2021/8/27.
//

import UIKit

class Model {
    var title: String
    var detail: String
    var dsid: Int
    
    init(title: String, detail: String, dsid: Int) {
        self.title = title
        self.detail = detail
        self.dsid = dsid
    }
}
