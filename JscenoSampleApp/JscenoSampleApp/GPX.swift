//
//  GPX.swift
//  JscenoSampleApp
//
//  Created by Choi on 2019/12/05.
//  Copyright © 2019 Choi. All rights reserved.
//

import Foundation

class GPX {
    @Published var title: String
    @Published var path: String
    
    init(title: String, path: String){
        self.title = title
        self.path = path
    }
}
