//
//  Message.swift
//  Map
//
//  Created by Abu Nabe on 26/2/2023.
//

import UIKit

class Message: UIViewController{
    var username = ["Stephanie", "Luke"]
    
    var message = ["I'm on my way", "You: I have a taxi booked already."]
    
    var timeago = ["5min ago", "7min ago"]
    
    var pic = ["2", "1"]
    
    var messageList : [MessageData] = [MessageData]()
    var cellid = "hey"
    private let backLabel: UILabel = {
        let Register = UILabel()
        Register.text = "Message"
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
    
    private let leftImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "arrow.backward")?.withRenderingMode(.alwaysOriginal)
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        
        return imageview
    }()
    
    private let rightImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "plus.message.fill")?.withRenderingMode(.alwaysOriginal)
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        
        return imageview
    }()
        
    let tableview: UITableView = {
        let tableView = UITableView()
        return tableView
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
    
    let Field: UITextField = {
        let field = UITextField()
        field.placeholder = "Search"
        field.layer.borderWidth = 2
        field.returnKeyType = .done
        field.backgroundColor = .white
        field.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        field.clipsToBounds = true
        field.tintColor = .black
        field.layer.cornerRadius = 20
        field.clearButtonMode = .whileEditing
        
        let placeholderColor = UIColor.black // Change this to the color you want
            
            // Create an attributed string with the desired placeholder color
            let attributes = [NSAttributedString.Key.foregroundColor: placeholderColor]
            let attributedPlaceholder = NSAttributedString(string: "Search", attributes: attributes)
            
            // Set the attributed string as the placeholder
            field.attributedPlaceholder = attributedPlaceholder
            
            return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(navBarView)
        view.addSubview(tableview)
        view.addSubview(Field)
        view.addSubview(tableview)
        view.addSubview(toolbarShadow)
    
        let height = view.height/14
        
        navBarView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: height)
        
        tableview.isHidden = true
        Field.isHidden = true
        
        configureNav()
        configureView()
        configureData()
        configureTableView()
        registerNotif()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .right
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func configureNav()
    {
        navBarView.addSubview(backLabel)
        navBarView.addSubview(rightImageView)
        navBarView.addSubview(leftImageView)
        
    
        backLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        backLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
    
        backLabel.anchor(paddingLeft: 0)
        

        let rightTap = UITapGestureRecognizer(target: self, action: #selector(GoToCreateGroup))
        rightImageView.isUserInteractionEnabled = true
        rightImageView.addGestureRecognizer(rightTap)

        let leftTap = UITapGestureRecognizer(target: self, action: #selector(goBack))
        leftImageView.isUserInteractionEnabled = true
        leftImageView.addGestureRecognizer(leftTap)
    }
    
    func configureView()
    {
        Field.anchor(top: navBarView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 30, paddingRight: 30, height: 40)
        
        toolbarShadow.anchor(top: Field.bottomAnchor, paddingTop: 5, width: view.width, height: 1)
        

        searchFieldExtension()
    }
   
    func configureData()
    {

                tableview.isHidden = false
                Field.isHidden = false
            
//                errorLabel.isHidden = false
//                ContinueButton.isHidden = false
//
//                if let objJson = value as? NSArray
//                {
                
//
//                    for element in objJson {
//                        let data = element as! NSDictionary
//                        if(data["roomid"] == nil){
//                            let sender = data["sender"] as! String
//                            let receiver = data["receiver"] as! String
//                            let last_message = data["last_message"] as! String
//                            let unread_count = data["message_count"] as! String
//                            let timestamp = data["last_sent"] as! String
//                            let seen = data["seen"] as! String
//
//                            if sender != currentUser
//                            {
//                                let msgList = MessageData(id: "", username: sender, receiver: "", message: last_message, image: URL_IMAGE, uncount: unread_count, timestamp: timestamp, seen: seen)
//                                self.messageList.append(msgList)
//                            }else if receiver != currentUser{
//                                let msgList = MessageData(id: "", username: receiver, receiver: receiver, message: last_message, image: URL_IMAGE, uncount: unread_count, timestamp: timestamp, seen: seen)
//                                self.messageList.append(msgList)
//                            }
//                        }else{
//                            let roomid = data["roomid"] as! String
//                            let username = data["username"] as! String
//                            let last_message = data["last_message"] as! String
//                            let unread_count = data["unread_count"] as! String
//                            let timestamp = data["timestamp"] as! String
//                            let seen = data["seen"] as! String
//                            let group_name = data["group_name"] as! String
//                            let group_pic = data["group_pic"] as! String
//
//                            let msgList = MessageData(id: roomid, username: username, receiver: group_name, message: last_message, image: group_pic, uncount: unread_count, timestamp: timestamp, seen: seen)
//
//                            self.messageList.append(msgList)
//                        }
//                    }
//
//                    messageList = messageList.sorted { $0.timestamp > $1.timestamp }
//
//                    self.tableview.reloadData()
//                }
//            case let .failure(error):
//                tableview.isHidden = true
//                errorLabel.isHidden = false
//                ContinueButton.isHidden = false
//                Field.isHidden = false
//                loadingIndicator.isHidden = true
//            }
//        }
        
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
    
    func configureTableView()
    {
        tableview.register(MessageListCell.self, forCellReuseIdentifier: cellid)
        
        tableview.rowHeight = 60
        tableview.separatorStyle = .none
        
        tableview.anchor(top: toolbarShadow.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, width: view.width, height: view.height)
        tableview.showsVerticalScrollIndicator = false
        tableview.delegate = self
        tableview.dataSource = self
    }
    func searchFieldExtension()
    {
    
    }
    
    @objc func goBack()
    {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func GoToCreateGroup()
    {
    }
    
    func registerNotif()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(updateMsg(notification:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
    }
    
    @objc func updateMsg(notification: NSNotification)
    {
        // haven't done yet, just using for improvision.
        let msg = notification.userInfo?["msg"] as! String
        let sender = notification.userInfo?["sender"] as! String
        let receiver = notification.userInfo?["receiver"] as! String
        let media = notification.userInfo?["media"] as! String
        
        if(media != "typing"){
            for var list in messageList{
                if(list.id == ""){
                    if(list.username == sender && list.receiver == receiver || list.receiver == sender && list.username == receiver){
                        
                        list.message = msg
                        tableview.reloadData()
                    }
                }else{
                    if(list.id == receiver){
                        
                        list.message = msg
                        tableview.reloadData()
                    }
                }
            }
        }else {
            for var (i, list) in messageList.enumerated(){
                if(list.id == ""){
                    if(list.username == sender && list.receiver == receiver || list.receiver == sender && list.username == receiver){
                        
                        let oldMsg = list.message
                        list.message = "is typing..."
                        tableview.reloadData()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in // Change
                            list.message = oldMsg
                            let element = messageList.remove(at: i)
                            messageList.insert(element, at: 0)
                            tableview.reloadData()
                        }
                    }
                }else{
                    if(list.id == receiver){
                        
                        let oldMsg = list.message
                        list.message = sender + " is typing..."
                        tableview.reloadData()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in // Change
                            list.message = oldMsg
                            let element = messageList.remove(at: i)
                            messageList.insert(element, at: 0)
                            tableview.reloadData()
                        }
                    }
                }
            }
        }
    }
}

extension Message: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! MessageListCell
        
        cell.selectionStyle = .none
        let items = messageList[indexPath.row]
        
        cell.NameLabel.text = items.username
            
        cell.MessageLabel.text = items.message
    
        cell.TextAgoLabel.text = items.timestamp
        
        cell.profileImageView.image = UIImage(named: items.image)
        return cell
    }
}
