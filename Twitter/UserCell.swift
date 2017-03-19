//
//  UserCell.swift
//  Twitter
//
//  Created by Abz Maxey on 14/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.backgroundColor = .red
        return imageView
    }()
    // Set input
    
    override var datasourceItem: Any? {
        didSet{
            guard let user = datasourceItem as? User else {
                return
            }
            nameLabel.text = user.name
            userNameLabel.text = user.userName
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let bioTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.font = UIFont.systemFont(ofSize: 15) // important for estimatedHeight to Work!
        return tv
    }()
    
    let followButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = twitterBlue.cgColor
        btn.layer.borderWidth = 1
        btn.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        btn.setTitle("Follow", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        btn.setTitleColor(twitterBlue, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return btn
    }()
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        showSeparator(dc: self)
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: leftAnchor, bottom: nil , right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        userNameLabel.anchor(nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(userNameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
