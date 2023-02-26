//
//  Profile.swift
//  Map
//
//  Created by Abu Nabe on 26/2/2023.
//

import UIKit

class Profile: UIViewController{
    
    let cellid = "ghost"
    
    var messageList : [MessageData] = [MessageData]()
    
    var username = ["Mike", "Luke", "Stephanie", "Rob", "Trisha", "Jake", "Lewis", "Ryan", "Daisy"]
    
    var message = ["Easy to work with", "Lovely conversation", "Love the vibes", "Great ride", "Great customer, would definately do it again.", "Great", "Hopefully I can meet him again.", "Amazing", "Sweet"]
    
    var timeago = ["5 star", "5 star", "4.5 star", "4 star", "4.6 star", "4.7star", "4.7star", "5.0 star", "4.2 star", "7h ago", "8h ago", "1d ago", "2d ago", "2d ago", "5w ago"," 5w ago", "1m ago", "1m ago", "2y ago", "9y ago"]
    
    var pic = ["19", "14", "8", "20", "7", "2",  "9", "10", "1", "6", "3", "12", "11", "12", "", "", "", "", "", ""]
    
    private let backLabel: UILabel = {
        let Register = UILabel()
        Register.text = "Profile"
        Register.textColor = .white
        Register.font = .boldSystemFont(ofSize: 16.0)
        Register.sizeToFit()
        return Register
    }()
    
    
    private let navBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()

    
   let toolbarShadow: UIView = {
       let line = UIView()
       line.backgroundColor = .lightGray
       line.layer.masksToBounds = false
       line.layer.shadowColor = UIColor.lightGray.cgColor
       line.layer.shadowOpacity = 0.8
       line.layer.shadowOffset = CGSize(width: 0, height: 1.0)
       line.layer.shadowRadius = 2
       return line
   }()
   
    
    private let rightImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "gear")?.withRenderingMode(.alwaysOriginal)
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        
        return imageview
    }()
    
    let profileImageView: UIImageView = {
        let profileimage = UIImageView()
        
        profileimage.contentMode = .scaleAspectFill
        profileimage.clipsToBounds = true
        profileimage.layer.borderWidth = 1
        profileimage.image = UIImage(named: "profile_icon")

        
        return profileimage
    }()
    
    let NameLabel: UILabel = {
        let Label = UILabel()
        Label.textAlignment = .center
        Label.text = "Abu Nabe"
        Label.textColor = UIColor(named: "Basic")
        Label.font = .boldSystemFont(ofSize: 12)
        return Label
    }()
    
    let HobbyLabel: UILabel = {
        let Label = UILabel()
        Label.textAlignment = .center
        Label.text = "Customer Review: 4.7 Rating"
        Label.textColor = UIColor(named: "Purple")
        Label.font = .boldSystemFont(ofSize: 12)
        Label.layer.shadowColor = UIColor(named: "Purple")?.cgColor
        Label.layer.shadowOpacity = 5
        Label.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        Label.layer.shadowRadius = 5

        return Label
    }()
    
    let tableview: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(navBarView)
        view.addSubview(toolbarShadow)
        view.addSubview(profileImageView)
        view.addSubview(NameLabel)
        view.addSubview(HobbyLabel)
        view.addSubview(tableview)
        let height = view.height/14
        
        navBarView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: height)
        
        toolbarShadow.anchor(top: navBarView.bottomAnchor, width: view.width, height: 1)
        
        configureNav()
        configure()
        configureTableView()
        configureData()
    }
    
    private func configureNav()
    {
        navBarView.addSubview(backLabel)
        navBarView.addSubview(rightImageView)
   
        backLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        backLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
    
        backLabel.anchor(paddingLeft: 0)
        

        rightImageView.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        rightImageView.anchor(right: navBarView.rightAnchor, paddingRight: 5, width: 30, height: 30)

    }
    
    func configure(){
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.anchor(top: toolbarShadow.bottomAnchor, paddingTop: 30, width: 80,height: 80)
        
        profileImageView.layer.cornerRadius = 80/2
        
        NameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        NameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 5)
        
        HobbyLabel.anchor(top: NameLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 80)
        
    }
    
    func configureTableView(){
        tableview.register(ReviewListCell.self, forCellReuseIdentifier: cellid)
        
        tableview.rowHeight = 60
        tableview.separatorStyle = .none
        
        tableview.anchor(top: HobbyLabel.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 5, width: view.width)
        tableview.showsVerticalScrollIndicator = false
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func configureData(){
        for (position,element) in username.enumerated()
        {
            let roomid = ""
            let username = username[position]
            let last_message = message[position]
            let timestamp = timeago[position]
            let pic = pic[position]
            let unread_count = ""
            let seen = ""
        
            let msgList = MessageData(id: roomid, username: username, receiver: username, message: last_message, image: pic, uncount: unread_count, timestamp: timestamp, seen: seen)
           //
            self.messageList.append(msgList)
            
            self.tableview.reloadData()
        }
    }
}

extension Profile: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! ReviewListCell
        
        cell.selectionStyle = .none
        let items = messageList[indexPath.row]
        
        cell.NameLabel.text = items.username
            
        cell.MessageLabel.text = items.message
    
        cell.TextAgoLabel.text = items.timestamp

        return cell
    }
}

