//
//  topdel.swift
//  MemeMeV1.0
//
//  Created by Mihaf on 05/10/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.
//


    


import Foundation
import UIKit
 
class topdelegate: NSObject, UITextFieldDelegate {


func textFieldDidBeginEditing(_ textField: UITextField) {
    if (textField.text == "TOP"){
    textField.text = ""
    }
}

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
         return true
}

}
