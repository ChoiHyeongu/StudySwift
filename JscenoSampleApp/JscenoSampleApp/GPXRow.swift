//
//  GPXRow.swift
//  JscenoSampleApp
//
//  Created by Choi on 2019/11/28.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI

struct GPXRow: View {
    
    var gpx: GPX
    
    var body: some View {
        HStack{
            gpx.onwer
        }
    }
}

struct GPXRow_Previews: PreviewProvider {
    static var previews: some View {
        GPXRow()
    }
}
