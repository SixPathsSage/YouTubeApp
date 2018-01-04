//
//  ViewController.swift
//  YoutubeApp
//
//  Created by Pradeep on 03/01/18.
//  Copyright © 2018 Siddharth. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(YouTubeCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        navigationController?.navigationBar.translucent = false
        let titleLable = UILabel(frame: CGRectMake(0, 0, view.frame.width - 32, view.frame.height))
        titleLable.textColor = UIColor.whiteColor()
        titleLable.text = "Home"
        navigationItem.titleView = titleLable
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellIdentifier", forIndexPath: indexPath)
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = ((view.frame.width - 16 - 16) * 9 / 16) + 74 + 16
        return CGSizeMake(view.frame.width, height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}


