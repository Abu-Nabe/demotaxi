//
//  ReviewListCell.swift
//  Map
//
//  Created by Abu Nabe on 27/2/2023.

import UIKit

class ReviewListCell: UITableViewCell{
            
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
        
        addSubview(NameLabel)
        addSubview(MessageLabel)
        addSubview(TextAgoLabel)
        addSubview(line)
   
        NameLabel.anchor(top: topAnchor,left: leftAnchor, paddingLeft: 5)
                        
        MessageLabel.anchor(top: NameLabel.bottomAnchor, left: leftAnchor, paddingLeft: 5, width: width)
    
        TextAgoLabel.anchor(top: topAnchor,right: rightAnchor, paddingRight: 10)
        
        line.anchor(left: leftAnchor,bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
       super.prepareForReuse()
        TextAgoLabel.text = nil
        MessageLabel.text = nil
        muteButton.image = nil
        NameLabel.text = nil
     }
}



