//
//  ViewController.swift
//  ColorfulBall
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import ChameleonFramework
import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {
  var circleView: UIView!
  var circleViewModel = CircleViewModel()
  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  func setup() {
    circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
    circleView.layer.cornerRadius = circleView.frame.width / 2.0
    circleView.center = view.center
    circleView.backgroundColor = .green
    view.addSubview(circleView)
    
    circleView
    .rx.observe(CGPoint.self, "center")
    .bind(to: circleViewModel.centerVariable)
    .addDisposableTo(disposeBag)
    
    circleViewModel.backgroundColorObservable
    .subscribe(onNext: { [weak self] backgroundColor in
      UIView.animate(withDuration: 0.1) {
        self?.circleView.backgroundColor = backgroundColor
        let viewBackgroundColor = UIColor(complementaryFlatColorOf: backgroundColor)
        if viewBackgroundColor != backgroundColor {
          self?.view.backgroundColor = viewBackgroundColor
        }
      }
    })
    .disposed(by: disposeBag)

    let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(_:)))
    circleView.addGestureRecognizer(gestureRecognizer)
  }

  @objc func circleMoved(_ recognizer: UIPanGestureRecognizer) {
    let location = recognizer.location(in: view)
    UIView.animate(withDuration: 0.1) {
      self.circleView.center = location
    }
  }
}
