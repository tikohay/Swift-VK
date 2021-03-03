//
//  UserFriendsService.swift
//  VK
//
//  Created by Karahanyan Levon on 22.02.2021.
//

import Foundation
import Alamofire

class UserFriendsService {
    
    let baseUrl = "https://api.vk.com"
    
    func getUserPhoto(){
        
        let token = Session.instance.token
        let path = "/method/photos.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.130",
            "album_id": "wall",
            "count": "1"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value ?? "0")
        }.resume()
    }
    
    func getUserFriends() {
        
        let token = Session.instance.token
        let path = "/method/friends.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.130",
            "fields": "city",
            "count": "1"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value ?? "0")
        }.resume()
    }
    
    func getUserGroups() {
        
        let token = Session.instance.token
        let path = "/method/groups.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.130",
            "extended": "1",
            "count": "1"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value ?? "0")
        }.resume()
    }
    
    func getUserSearchGroups() {
        
        let token = Session.instance.token
        let path = "/method/groups.search"
        let parameters: Parameters = [
            "access_token": token,
            "q": "football",
            "v": "5.130",
            "count": "1"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value ?? "0")
        }.resume()
    }
}


