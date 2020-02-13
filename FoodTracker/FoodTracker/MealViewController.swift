//
//  ViewController.swift
//  FoodTracker
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var photoImageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    nameTextField.delegate = self
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    print("textFieldShoulReturn")
    return true
  }

  func textFieldDidEndEditing(_ textField: UITextField) {
    print("textFieldDidEndEditing")
  }

  @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    nameTextField.resignFirstResponder()
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.delegate = self
    present(imagePickerController, animated: true, completion: nil)
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    }
    
    photoImageView.image = selectedImage
    dismiss(animated: true, completion: nil)
  }
}
