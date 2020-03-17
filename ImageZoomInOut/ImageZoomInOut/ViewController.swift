//
//  ViewController.swift
//  ImageZoomInOut
//
//  Created by Choi on 2020/03/17.
//  Copyright © 2020 Choi. All rights reserved.
//

import PhotoSlider
import UIKit

class ViewController: UIViewController {
  @IBOutlet var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    var slider = PhotoSlider.ViewController(imageURLs: images)
    slider.currentPage = indexPath.row
    photoSlider.transitioningDelegate = self
    present(photoSlider, animated: true, completion: nil)
  }
}
