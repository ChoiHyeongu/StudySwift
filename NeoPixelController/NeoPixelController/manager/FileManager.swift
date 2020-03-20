//
//  FileManager.swift
//  NeoPixelController
//
//  Created by Choi on 2020/03/20.
//  Copyright © 2020 Choi. All rights reserved.
//

import Foundation

class FileManager {
  static let shared = FileManager()

  private func documentDirectory() -> String {
    let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    return documentDirectory[0]
  }

  private func append(toPath path: String, withPathComponent pathComponent: String) -> String? {
    if var pathURL = URL(string: path) {
      pathURL.appendPathComponent(pathComponent)
      return pathURL.absoluteString
    }
    return nil
  }

  func saveRGB(text: String, toDirectory directory: String, withFileName fileName: String) {
    guard let filePath = self.append(toPath: directory, withPathComponent: fileName) else { return }

    do {
      try text.write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch {
      print("Error", error)
      return
    }

    print("Save successful")
  }

  func readRGBList(fromDocumentsWithFileName fileName: String) {
    guard let filePath = self.append(toPath: self.documentDirectory(), withPathComponent: fileName) else { return }

    do {
      let savedString = try String(contentsOfFile: filePath)
      print(savedString)
    } catch {
      print("Error reading saved file")
    }
  }
  
  func deleteRGB() {
    
  }
}
