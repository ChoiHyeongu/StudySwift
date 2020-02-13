//
//  CircleViewModel.swift
//  ColorfulBall
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import ChameleonFramework
import Foundation
import RxCocoa
import RxSwift

class CircleViewModel {
  var centerVariable = BehaviorRelay<CGPoint?>(value: .zero)
  var backgroundColorObservable: Observable<UIColor>!

  init() {
    setup()
  }

  func setup() {
    backgroundColorObservable = centerVariable.asObservable()
      .map { center in
        guard let center = center else { return UIColor.flatten(.black)()}
        
        let red: CGFloat = ((center.x + center.y).truncatingRemainder(dividingBy: 255.0)) / 255.0
        let green: CGFloat = 0.0
        let blue: CGFloat = 0.0
        
        return UIColor.flatten(UIColor(red: red, green: green, blue: blue, alpha: 1.0))()
      }
  }
}
