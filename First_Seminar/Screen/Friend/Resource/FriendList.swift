//
//  FriendList.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/04.
//

import Foundation
struct FriendList :Hashable{
    let name : String
    let message :String
    let image : String
    
}
extension FriendList {
    static let list : [FriendList] = [
        FriendList(name: "안솝트", message: "언제 본건데??",image: "Friend/profileImage1"),
        FriendList(name: "최솝트", message: "피곤해요",image: "Friend/profileImage2"),
        FriendList(name: "정솝트", message: "살려줘요",image: "Friend/profileImage3"),
        FriendList(name: "강솝트", message: "살려줘요", image: "Friend/profileImage4"),
        FriendList(name: "오솝트", message: "살려줘요", image: "Friend/profileImage5"),
        FriendList(name: "황솝트", message: "살려줘요",image: "Friend/profileImage6"),
        FriendList(name: "김솝트", message: "언제 본건데??",image: "Friend/profileImage7"),
        FriendList(name: "고솝트", message: "살려줘요",image:  "Friend/profileImage8"),
        FriendList(name: "하솝트", message: "살려줘요",image: "Friend/profileImage9"),
        FriendList(name: "정솝트", message: "언제 본건데??",image: "Friend/profileImage2"),
        FriendList(name: "최솝트", message: "살려줘요",image: "Friend/profileImage3"),
        FriendList(name: "오솝트", message: "피곤해요", image: "Friend/profileImage4"),
        FriendList(name: "강솝트", message: "언제 본건데??", image: "Friend/profileImage5"),
        FriendList(name: "김솝트", message: "피곤해요",image: "Friend/profileImage6"),
        FriendList(name: "고솝트", message: "언제 본건데??",image: "Friend/profileImage7"),
        FriendList(name: "황솝트", message: "피곤해요",image:  "Friend/profileImage8"),
    ]
}

