//
//  MessageListCell.swift
//  Project
//
//  Created by Abu Nabe on 9/8/21.
//

import UIKit

class MessageListCell: UITableViewCell{
    
    var blocked = String()
    
    let profileImageView: UIImageView = {
        let profileimage = UIImageView()
        
        profileimage.contentMode = .scaleAspectFill
        profileimage.clipsToBounds = true
        profileimage.image = UIImage(named: "ProfileIcon")
        profileimage.layer.borderWidth = 1
        profileimage.layer.borderColor = UIColor(named: "Basic2")?.cgColor
        return profileimage
    }()
    
    var NameLabel: UILabel = {
        let Label = UILabel()
        Label.textAlignment = .left
        Label.text = "Username"
        Label.textColor = UIColor(named: "Basic")
        Label.font = .boldSystemFont(ofSize: 16)
        Label.lineBreakMode = .byTruncatingTail
        return Label
    }()
    
    var MessageLabel: UILabel = {
        let Label = UILabel()
        Label.text = "Message"
        Label.adjustsFontSizeToFitWidth = false
        Label.lineBreakMode = .byTruncatingTail
        Label.font = .systemFont(ofSize: 14.0)
        return Label
    }()
    
    var UnreadLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "Purple")
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
    
        return label
    }()
    
    var TextAgoLabel: UILabel = {
        let Label = UILabel()
        Label.textAlignment = .center
        Label.text = "Date"
        Label.textColor = UIColor(named: "Basic")
        Label.font = .systemFont(ofSize: 14.0)
        return Label
    }()
    
    var line: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.layer.masksToBounds = false
        line.layer.shadowColor = UIColor.lightGray.cgColor
        line.layer.shadowOpacity = 0.2
        line.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        return line
    }()
        
    let muteButton: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "bell.slash.fill")
        imageview.tintColor = UIColor(named: "Gray2")
        imageview.isHidden = true
        return imageview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        addSubview(NameLabel)
        addSubview(MessageLabel)
        addSubview(TextAgoLabel)
        addSubview(UnreadLabel)
        addSubview(line)
        addSubview(muteButton)
        
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.anchor(left: leftAnchor, paddingLeft: 5, width: 50, height: 50)
        profileImageView.layer.cornerRadius = 50/2
        
        NameLabel.anchor(top: profileImageView.topAnchor,left: profileImageView.rightAnchor, paddingLeft: 5)
                
        muteButton.anchor(top: profileImageView.topAnchor, left: NameLabel.rightAnchor, paddingLeft: 2)
        
        MessageLabel.anchor(left: profileImageView.rightAnchor, bottom: profileImageView.bottomAnchor, paddingLeft: 5, width: 150)
      
        UnreadLabel.anchor(top: profileImageView.topAnchor, right: rightAnchor, paddingRight: 5)

        TextAgoLabel.anchor(bottom: profileImageView.bottomAnchor,right: rightAnchor, paddingRight: 10)
        
        line.anchor(left: leftAnchor,bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
       super.prepareForReuse()
        TextAgoLabel.text = nil
        UnreadLabel.text = nil
        MessageLabel.text = nil
        muteButton.image = nil
        NameLabel.text = nil
        profileImageView.image = nil
     }
}


