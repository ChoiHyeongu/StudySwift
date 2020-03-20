//
//  RGBListViewModel.swift
//  NeoPixelController
//
//  Created by Choi on 2020/03/20.
//  Copyright © 2020 Choi. All rights reserved.
//

import Foundation

class RGBListViewModel {
  @Published var RGBWList: [RGBW]

  init(RGBWList: [RGBW]) {
    self.RGBWList = RGBWList
  }

  /// RGB파일 지우기
  /// - Parameter fileName: String
  func removeRGBWItem(fileName: String) {}

  /// RGBW 리스트 가져오기
  func getRGBWList() {
    FileManager.shared.readRGBList(fromDocumentsWithFileName: "RGBWList")
  }
}
