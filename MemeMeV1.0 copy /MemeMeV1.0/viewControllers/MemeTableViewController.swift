//
//  MemeTableViewController.swift
//  MemeMeV1.0
//
//  Created by Mihaf on 14/10/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    var memes: [Meme]! {
    let object = UIApplication.shared.delegate
    let appDelegate = object as! AppDelegate
    return appDelegate.memes
    
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memeDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        memeDetailViewController.meme = self.memes[(indexPath as  NSIndexPath).row]
        self.present(memeDetailViewController, animated: true, completion: nil)
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
            let tableViewCell  = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")! as! MemeTableViewCell
    
  
            tableViewCell.memeTitle?.text =  memes[indexPath.row].top + " " + memes[indexPath.row].bottom
            tableViewCell.memeImage?.image = memes[indexPath.row].memedImage

            return tableViewCell
    }
    
    
       @IBAction func addMeme(_ sender: Any) {
        let addViewController = storyboard?.instantiateViewController(withIdentifier: "MemeEditiorViewController") as! MemeEditiorViewController
            self.present(addViewController, animated: true, completion: nil)
             
       }
    func tableView(_ tableView: UITableView, commit editingStyle:   UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if ( editingStyle == .delete){
        let object = UIApplication.shared.delegate

           let appDelegate = object as! AppDelegate
        appDelegate.memes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
            
       
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
           self.tableView!.reloadData()
   
       }
    

}
