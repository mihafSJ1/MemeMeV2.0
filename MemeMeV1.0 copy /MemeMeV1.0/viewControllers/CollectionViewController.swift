
//  CollectionViewController.swift
//  MemeMeV1.0
//
//  Created by Mihaf on 18/10/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.


import UIKit

class CollectionViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
  var memes: [Meme]! {
  let object = UIApplication.shared.delegate
  let appDelegate = object as! AppDelegate
  return appDelegate.memes
  
  }
    
   
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView!.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let space:CGFloat = 1.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
      
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
           let memeDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
             memeDetailViewController.meme = self.memes[(indexPath as  NSIndexPath).row]
             self.present(memeDetailViewController, animated: true, completion: nil)
    
    }
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return memes.count
        
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath)as! MemeCollectionViewCell
        collectionViewCell.memeImage?.image = memes[indexPath.row].memedImage
   
        return collectionViewCell
   
      }

    @IBAction func addMeme(_ sender: Any) {
        let addViewController = storyboard?.instantiateViewController(withIdentifier: "MemeEditiorViewController") as! MemeEditiorViewController
                 self.present(addViewController, animated: true, completion: nil)
                  
    }
}
