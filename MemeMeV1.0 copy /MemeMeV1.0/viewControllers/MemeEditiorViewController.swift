//
//  ViewController.swift
//  MemeMeV1.0
//
//  Created by Mihaf on 05/10/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.
//

import UIKit


class MemeEditiorViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{

    @IBOutlet weak var buttom: UITextField!
    @IBOutlet weak var top: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var albumButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var cameraButton: UIBarButtonItem!

    let topText = "TOP"
    let bottomText = "BOTTOM"
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor:UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "impact", size: 50)!,
        NSAttributedString.Key.strokeWidth: -1.0  ]
    
        let buttomtextfieldDelegate = bottomDelegate()
        let toptextfieldDelegate = topdelegate()
        
        
        
    override func viewWillAppear(_ animated: Bool) {
        
           cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
           subscribeToKeyboardNotifications()
              
           }
    override func viewWillDisappear(_ animated: Bool) {
        
            super.viewWillDisappear(animated)
            unsubscribeFromKeyboardNotifications()
        }
    override func viewDidLoad() {
         
            super.viewDidLoad()
            shareButton.isEnabled = false
            prepareTextField(textField: top, defaultText:topText)
            prepareTextField(textField: buttom, defaultText:bottomText)
            self.top.delegate = toptextfieldDelegate
            self.buttom.delegate = buttomtextfieldDelegate
            self.top.defaultTextAttributes = memeTextAttributes
            self.buttom.defaultTextAttributes = memeTextAttributes
            self.top.textAlignment = .center
            self.buttom.textAlignment = .center
            top.borderStyle = UITextField.BorderStyle.none
            buttom.borderStyle = UITextField.BorderStyle.none
           
        }
    func save() {
                // Create the meme
            let meme = Meme(top: top.text!, bottom: buttom.text!, originalImage: imageView.image!, memedImage:generateMemedImage())
            let object = UIApplication.shared.delegate

            let appDelegate = object as! AppDelegate
            appDelegate.memes.append(meme)
         
        }
   func generateMemedImage() -> UIImage {

    // TODO: Hide toolbar and navbar
       toolbar.isHidden = true
       navbar.isHidden = true
    
    // Render view to an image
    UIGraphicsBeginImageContext(self.view.frame.size)
    view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
    let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
       toolbar.isHidden = false
       navbar.isHidden = false
        return memedImage
    
        }
    
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    

    @IBAction func camera(_ sender: Any) {
      pickImage(sourceType: .camera)
    }
    @IBAction func cancel(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    
    @IBAction func share(_ sender: Any) {
        let image = generateMemedImage()
        let share = UIActivityViewController(activityItems: [image], applicationActivities:nil)
        share.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed:
            Bool, arrayReturnedItems: [Any]?, error: Error?) in
                if (completed) {
                
                        self.save()
                    self.dismiss(animated: true, completion: nil)
                   
                }
            }
                  present(share, animated:true,completion: nil)
    }
    
    @IBAction func album(_ sender: Any) {
        pickImage(sourceType: .photoLibrary)
    }
    
    func pickImage(sourceType: UIImagePickerController.SourceType){
      let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = sourceType
     present(picker, animated:true,completion: nil)
           shareButton.isEnabled = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
          didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
          picker.dismiss(animated: true, completion: nil)
          if let image = info[.editedImage] as? UIImage {
          imageView.image = image
    
        }// to check does the user crop the image or not
          else if let image = info[.originalImage] as? UIImage {
                imageView.image = image
          
                     }
         shareButton.isEnabled = true
        
         }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            picker.dismiss(animated: true, completion: nil)
             
         }
    func subscribeToKeyboardNotifications() {

          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
          
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
          
      }

    func unsubscribeFromKeyboardNotifications() {

          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
      }
    
    @objc func keyboardWillShow(_ notification:Notification) {
       if (buttom.isEditing){
       
        if view.frame.origin.y == 0 {
       view.frame.origin.y = -getKeyboardHeight(notification)
          }
        }
      }

      @objc func keyboardWillHide(_ notification:Notification) {
            self.view.frame.origin.y = 0
      }
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {

          let userInfo = notification.userInfo
          let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
          return keyboardSize.cgRectValue.height
      }
     func prepareTextField(textField: UITextField, defaultText: String) {
               textField.text = defaultText
          
              
       
    
    }
    
}

