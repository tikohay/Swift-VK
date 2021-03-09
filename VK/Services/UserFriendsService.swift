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
    
    func getUserPhoto(userId: Int, completion: @escaping ([PhotosClass]) -> Void) {
        
        let token = Session.instance.token
        let path = "/method/photos.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.130",
            "owner_id": userId,
            "album_id": "profile"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            
            let photos = try? JSONDecoder().decode(PhotosResponse.self, from: data)
            
            completion(photos?.response.items ?? [])
        }
    }
    
    func getUserFriends(completion: @escaping ([UserClass]) -> Void) {
        
        let token = Session.instance.token
        let path = "/method/friends.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.130",
            "fields": "photo_200_orig",
            "count": "20"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            
            let friends = try? JSONDecoder().decode(FriendsResponse.self, from: data)
            
            completion(friends?.response.items ?? [])
        }
    }
    
    func getUserGroups(completion: @escaping ([GroupClass]) -> Void) {
        
        let token = Session.instance.token
        let path = "/method/groups.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.130",
            "extended": "1"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            
            let groups = try? JSONDecoder().decode(GroupsResponse.self, from: data)
            completion(groups?.response.items ?? [])
        }
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


