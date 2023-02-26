//
//  SearchModel.swift
//  Project
//
//  Created by Abu Nabe on 9/8/21.
//

import UIKit
import AVFoundation

struct SearchData
{
    var image: String
    var username: String
    var hobby: String
    var id : String
    var privacy: String
}

struct HistoryData
{
    var image: String
    var username: String
    var hobby: String
    var id : String
    var privacy: String
}

struct SocialData
{
    var image: String
    var username: String
    var hobby: String
}

struct PointsData
{
    var image: String
    var username: String
    var points: String
    var status: String
}

struct MessageData
{
    var id: String
    var username: String
    var receiver: String
    var message: String
    var image: String
    var uncount: String
    var timestamp: String
    var seen: String
}

struct GroupMessageData
{
    var roomid: String
    var username : String
    var message: String
    var uncount: String
    var timestamp: String
    var seen: String
    var group_name: String
    var group_pic: String
}

struct ChatData
{
    var id: String
    var message: String?
    var sender: String
    var receiver: String
    var timestamp : String
    var media : String
    var error : String
}

struct ExclusiveData
{
    var roomid: String
    var username: String
    var message: String?
    var timestamp: String
    var media : String
    var error : String
}

struct HashtagData
{
    var hashtag: String
}


struct VideoData
{
    var videoUrl: String
    var videoPublisher: String
    var videoHobby: String
    var videoDescription: String
    var timestring : String
    var commentable: String
    var player: AVPlayer
}

//
//struct CommentData
//{
//    var videoUrl: String
//    var userComment: String
//    var comment: String
//    var commentLikes: String
//    var commentID: String
//    var timestring: String
//}
//
//struct ReplyData
//{
//    var commentID: String
//    var username: String
//    var comment: String
//    var timestring: String
//    var replyID: String
//}

struct GroupOnlineData
{
    var roomID: String
    var username: String
    var seen: String
    var online: String
}

struct NotifData
{
    var username: String
    var creator: String
    var actual_id: String
    var description: String
    var timestring : String
    var videoUrl : String
}

struct LeaderboardData
{
    var username: String
    var country: String
    var hobby: String
    var daily_point: String
    var monthly_point: String
    var yearly_point: String
    var alltime_point: String
}

struct LeaderboardChatData
{
    var username: String
    var message: String
    var timestamp: String
    var country: String
}

