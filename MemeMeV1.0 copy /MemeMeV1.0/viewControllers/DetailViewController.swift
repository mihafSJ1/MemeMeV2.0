//
//  DetailViewController.swift
//  MemeMeV1.0
//
//  Created by Mihaf on 19/10/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.


import UIKit

class DetailViewController: UIViewController {
    var meme: Meme!
    
      @IBOutlet weak var imageView: UIImageView!
    
         override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            imageView?.image = meme.memedImage
    }
    @IBAction func cancel(_ sender: Any) {
           dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   

}
