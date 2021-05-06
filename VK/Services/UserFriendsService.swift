//
//  UserFriendsService.swift
//  VK
//
//  Created by Karahanyan Levon on 22.02.2021.
//

import Foundation
import Alamofire
import RealmSwift

class UserFriendsService {
    
    let baseUrl = "https://api.vk.com"
    
    func saveUserData<T: Object>(_ usersData: [T]) {
        do {
            let realm = try Realm()
            let oldUsersData = realm.objects(T.self)
            realm.beginWrite()
            realm.delete(oldUsersData)
            
            realm.add(usersData)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func getUserPhoto(userId: Int) {
        
        let token = Session.instance.token
        print(token)
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
            
            guard let photos = try? JSONDecoder().decode(PhotosResponse.self, from: data) else { return }
            
            self.saveUserData(photos.response.items)
        }
    }
//    https://api.vk.com/method/newsfeed.get?access_token=aa56c88cad9d0ccc44c72624978f25ea02a43c66ea023f6f1cf9ba9151c353a279b0fc53d527ca6e7d483&v=5.130&filters=photo
    
    //https://api.vk.com/method/newsfeed.get?access_token=b3786303ec6b46c0d95326f6d5a9c92506a0c1601bf81eb79eb8a1787dbb559ba562da070d4563bc7090a&v=5.130&count=1
    func getUserFriends() {
        
        let token = Session.instance.token
        print(token)
        let path = "/method/friends.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.130",
            "fields": "photo_200_orig",
            "count": "20"
        ]
        
        let url = baseUrl + path
        print(url, parameters)
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            
            guard let friends = try? JSONDecoder().decode(FriendsResponse.self, from: data) else { return }
            
            self.saveUserData(friends.response.items)
        }
    }
    
    func getUserGroups() {
        
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
            
            guard let groups = try? JSONDecoder().decode(GroupsResponse.self, from: data) else { return }
            
            self.saveUserData(groups.response.items)
        }
    }
    
    func getUserSearchGroups(group name: String) {
        
        let token = Session.instance.token
        let path = "/method/groups.search"
        let parameters: Parameters = [
            "access_token": token,
            "q": name,
            "v": "5.130",
            "count": "20"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            
            guard let availableGroups = try? JSONDecoder().decode(AvailableGroupsResponse.self, from: data) else { return }
            
            self.saveUserData(availableGroups.response.items)
        }
    }
    
    func getNews(completionHandler: @escaping (NewsResponseInfo) -> Void) {
        
        let token = Session.instance.token
        let path = "/method/newsfeed.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.130",
            "count": "100"
        ]
        
        let url = baseUrl + path
        
        DispatchQueue.global(qos: .userInteractive).async {
            AF.request(url, method: .get, parameters: parameters).responseData { response in
                guard let data = response.value else { return }
                guard let newsData = try? JSONDecoder().decode(NewsResponse.self, from: data) else { return }
                
                let news = newsData.response
                
                completionHandler(news)
            }
        }
    }
}


