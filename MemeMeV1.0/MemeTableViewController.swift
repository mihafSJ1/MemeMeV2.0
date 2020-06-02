//
//  MemeTableViewController.swift
//  MemeMeV1.0
//
//  Created by Mihaf on 10/10/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.


import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
   
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return memes.count
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell  = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")! as! MemeTableViewCell
        
        tableViewCell.memeTitle?.text = memes[indexPath.row].top + memes[indexPath.row].bottom
        tableViewCell.memeImage.image = memes[indexPath.row].memedImage
        tableViewCell.layer.cornerRadius = 8
        tableViewCell.backgroundColor = .brown
        tableViewCell.memeTitle.text = "hello"
        tableViewCell.memeImage.layer.cornerRadius = tableViewCell.memeImage.frame.height/2
        return tableViewCell
        
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    

   

}
