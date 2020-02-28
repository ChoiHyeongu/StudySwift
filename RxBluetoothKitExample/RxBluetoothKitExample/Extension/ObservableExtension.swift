//
//  ObservableExtension.swift
//  RxBluetoothKitExample
//
//  Created by Choi on 2020/02/28.
//  Copyright © 2020 Choi. All rights reserved.
//

import Foundation
import RxBluetoothKit
import RxCocoa
import RxSwift

extension Observable {
    func timeoutIfNoEvent(_ dueTime: RxTimeInterval) -> Observable<Element> {
        let timeout = Observable
            .never()
            .timeout(dueTime, scheduler: MainScheduler.instance)
        
        return self.amb(timeout)
    }
}
