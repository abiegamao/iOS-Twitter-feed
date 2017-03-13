//
//  Cells.swift
//  Twitter
//
//  Created by Abz Maxey on 10/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

func showSeparator(dc: DatasourceCell)  {
    dc.separatorLineView.isHidden = false
    dc.separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
}

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
        showSeparator(dc: self)
        addSubview(textLabel)
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
        showSeparator(dc: self)
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
