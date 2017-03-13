//
//  Cells.swift
//  Twitter
//
//  Created by Abz Maxey on 10/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import LBTAComponents
let twitterBlue = UIColor(r: 61, g: 167, b: 244)

class UserFooter: DatasourceCell {
    let textLabel : UILabel = {
        let txt = UILabel()
        txt.text = "Show me more"
        txt.font = UIFont.systemFont(ofSize: 15)
        txt.textColor = twitterBlue
        return txt
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
        //backgroundColor = .green
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class UserHeader: DatasourceCell {
    let textLabel : UILabel = {
        let txt = UILabel()
        txt.text = "WHO TO FOLLOW"
        txt.font = UIFont.boldSystemFont(ofSize: 16)
        txt.textColor = UIColor.black
        return txt
    }()
    override func setupViews() {
        super.setupViews()
       // backgroundColor = .blue
        addSubview(textLabel)
       // textLabel.fillSuperview()
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class UserCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        //imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    // Set input
    override var datasourceItem: Any?{
        didSet{
            //nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joenabie Gamao"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.backgroundColor = .green
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@abiegamao"
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.font = UIFont.systemFont(ofSize: 14)
        //label.backgroundColor = .purple
        return label
    }()
    
    let bioTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.text = "She likes to code,read dance and eat. How wonderful is his Grace for me. She doesn't mind being alone. It increases her stamina and productivity."
        return tv
    }()
    
    let followButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = twitterBlue.cgColor
        btn.layer.borderWidth = 1
        btn.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        btn.setTitle("Follow", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        btn.setTitleColor(twitterBlue, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
        return btn
    }()

    
    override func setupViews() {
        super.setupViews()
        //backgroundColor = .yellow
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
