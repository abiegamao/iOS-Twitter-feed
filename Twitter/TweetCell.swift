//
//  TweetCell.swift
//  Twitter
//
//  Created by Abz Maxey on 14/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample"
        tv.backgroundColor = .clear
        return tv
    }()
    
    let replyButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    let retweetButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal) , for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    let likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal) , for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    let messageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    override var datasourceItem: Any? {
        didSet{
            guard let tweet = datasourceItem as? Tweet else { return }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            let userNameString = " \(tweet.user.userName) \n"
            
            attributedText.append(NSAttributedString(string: userNameString, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
            

            // space between
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
                
            messageTextView.attributedText = attributedText
            
                  }
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        showSeparator(dc: self)
        addSubview(profileImageView)
        addSubview(messageTextView)

   

        //separatorLineView.isHidden = false        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil , right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        setupBottomButtons()
        
    }
    
    fileprivate func setupBottomButtons(){
        
        // UIStackViews
        let replyButtonView = UIView()
        //replyButtonView.backgroundColor = .red
        let retweetButtonView = UIView()
        //retweetButtonView.backgroundColor = .blue
        let likeButtonView = UIView()

        let dmButtonView = UIView()
        
        let stackView = UIStackView(arrangedSubviews: [replyButtonView, retweetButtonView, likeButtonView, dmButtonView ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 4, widthConstant: 0, heightConstant: 20)
      
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 4, widthConstant: 0, heightConstant: 0)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(messageButton)
        
        
        replyButton.anchor(replyButtonView.topAnchor, left: replyButtonView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        retweetButton.anchor(retweetButtonView.topAnchor, left: retweetButtonView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(likeButtonView.topAnchor, left: likeButtonView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        messageButton.anchor(dmButtonView.topAnchor, left: dmButtonView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        

    }
}
