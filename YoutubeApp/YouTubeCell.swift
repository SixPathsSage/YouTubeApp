//
//  YouTubeCell.swift
//  YoutubeApp
//
//  Created by Pradeep on 04/01/18.
//  Copyright © 2018 Siddharth. All rights reserved.
//

import UIKit

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
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLable : UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Kakashi getting his Sharingan"
        return lable
    }()
    
    let subTitleLable : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.lightGrayColor()
        textView.text = "Kakashi Hatake • 1,999,912,121 Views • 10 year"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        return textView
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
        addConstraint(NSLayoutConstraint(item: subTitleLable, attribute: .Top, relatedBy: .Equal, toItem: titleLable, attribute: .Bottom, multiplier: 1, constant: 4))
        //Left
        addConstraint(NSLayoutConstraint(item: subTitleLable, attribute: .Left, relatedBy: .Equal, toItem: profileImage, attribute: .Right, multiplier: 1, constant: 8))
        //Right
        addConstraint(NSLayoutConstraint(item: subTitleLable, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImage, attribute: .Right, multiplier: 1, constant: 0))
        //Height
        addConstraint(NSLayoutConstraint(item: subTitleLable, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 30))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
