//
//  LocalStorage.swift
//  vovy
//
//  Created by Peter Andrew on 27/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import Foundation

class LocalStorage {
    static let defaults = UserDefaults.standard
    static let BASE_API = "https://mc2-be.herokuapp.com/users/"
    
    enum State {
        case create
        case update
    }
    
    static func getCategory() -> Array<String>{
        var category:Array<String> = []
        if let  category1 = defaults.string(forKey: "category1"){
            category.append(category1)
        }
        if let category2 = defaults.string(forKey: "category2"){
            category.append(category2)
        }
        if let category3 = defaults.string(forKey: "category3"){
            category.append(category3)
        }
        return category
    }
    static func getName() -> String {
        if let name = defaults.string(forKey: "name") {
            return name
        }
        return ""
    }
    
    static func getDeviceToken() -> String {
        if let deviceId = defaults.string(forKey: "deviceId") {
            return deviceId
        }
        return ""
    }
    
    static func getUUID() -> String {
        if let uuid = defaults.string(forKey: "uuid") {
            return uuid
        } else {
            defaults.set(NSUUID().uuidString, forKey: "uuid")
        }
        return getUUID()
    }
    
    static func getQuizFlag() -> Bool {
        return defaults.bool(forKey: "quizFlag")
    }
    
    static func setQuizFlag(_ value:Bool) {
        defaults.set(value, forKey: "quizFlag")
    }
    
    
    static func postData(state:State) {
        let uuid = getUUID()
        print(uuid)
        var url:URL!
        switch state {
            case .create:
                 url = URL(string: BASE_API)
            case .update:
                 url = URL(string: "\(BASE_API)\(uuid)")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let payload = payloadStringBuilder().data(using: .utf8)!
        let task = URLSession.shared.uploadTask(with: request, from: payload) { data, response, error in
            print(String(data: data!, encoding: .utf8) ?? "cant compare")
        }
        task.resume()
    }
    
    private static func payloadStringBuilder() -> String{
        var baseParams = "uuid=\(getUUID())&deviceId=\(getDeviceToken())&name=\(getName())"
        let category = getCategory()
        print(baseParams)
        if(category.count > 0){
            for i in 0...(category.count-1) {
                baseParams += "&category[\(i)]=\(category[i])"
            }
        }
        return baseParams
    }
    
    static func saveCategory(_ categories:Array<String>) {
        if categories.count > 0 {
            for i in 0...(categories.count-1) {
                defaults.set(categories[i], forKey: "category\(i+1)")
            }
        }
        postData(state: .update)
    }
    
    static func saveName(_ name:String) {
        defaults.set(name,forKey: "name")
        postData(state: .update)
    }
    
    static func saveDeviceToken(_ token:String) {
        defaults.set(token, forKey: "deviceId")
        if defaults.string(forKey: "deviceId") != nil {
            postData(state: .update)
        } else {
            postData(state: .create)
        }
    }
}

