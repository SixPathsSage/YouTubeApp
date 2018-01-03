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
        title = "Home"
        collectionView!.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(YouTubeCell.self, forCellWithReuseIdentifier: "cellIdentifier")
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
        return CGSizeMake(view.frame.width, 200)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}

class YouTubeCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubViews()
        thumbnailImage.image = UIImage(named: "thumbnail")
        profileImage.image = UIImage(named: "profile")
    }
    
    let thumbnailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let seperator : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        return view
    }()
    
    let titleLable : UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Kakashi getting his Sharingan"
        return lable
    }()
    
    let subTitleLable : UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Kakashi Hatake • 1,999,912,121 Views • 1 year"
        return lable
    }()
    
    func setSubViews()
    {
        addSubview(thumbnailImage)
        addSubview(seperator)
        addSubview(profileImage)
        addSubview(titleLable)
        addSubview(subTitleLable)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: [thumbnailImage])
        addConstraintsWithFormat("H:|[v0]|", views: [seperator])
        addConstraintsWithFormat("H:|-16-[v0(50)]", views: [profileImage])
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(50)]-16-[v2(1)]|", views: [thumbnailImage, profileImage, seperator])
        
        //MARK:- TitleLable
        //Top
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .Top, relatedBy: .Equal, toItem: thumbnailImage, attribute: .Bottom, multiplier: 1, constant: 8))
        //Left
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .Left, relatedBy: .Equal, toItem: profileImage, attribute: .Right, multiplier: 1, constant: 8))
        //Right
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImage, attribute: .Right, multiplier: 1, constant: 0))
        //Height
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        
        //MARK:- SubTitleLable
        //Top
        addConstraint(NSLayoutConstraint(item: subTitleLable, attribute: .Top, relatedBy: .Equal, toItem: titleLable, attribute: .Bottom, multiplier: 1, constant: 8))
        //Left
        addConstraint(NSLayoutConstraint(item: subTitleLable, attribute: .Left, relatedBy: .Equal, toItem: profileImage, attribute: .Right, multiplier: 1, constant: 8))
        //Right
        addConstraint(NSLayoutConstraint(item: subTitleLable, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImage, attribute: .Right, multiplier: 1, constant: 0))
        //Height
        addConstraint(NSLayoutConstraint(item: subTitleLable, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView
{
    func addConstraintsWithFormat(format : String, views : [UIView])
    {
        var viewDictionary = [String : UIView]()
        for (index, view) in views.enumerate()
        {
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary["v\(index)"] = view
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}

