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
    static let BASE_API = "http://localhost:3000/users/"
    
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
        }
        return ""
    }
    
    static func getQuizFlag() -> Bool {
        return defaults.bool(forKey: "quizFlag")
    }
    
    static func setQuizFlag(_ value:Bool) {
        defaults.set(value, forKey: "quizFlag")
    }
    
    
    static func postData(state:State) {
        let uuid = getUUID()
        let session = URLSession.shared
        var url:URL?
        
        switch state {
            case .create:
                 url = URL(string: BASE_API)
            case .update:
                 url = URL(string: "\(BASE_API)\(uuid)")
        }
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
        let json = [
            "category": getCategory(),
            "name": getName(),
            "deviceId": getDeviceToken(),
            "uuid": getUUID()
        ] as [String : Any]
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        print(jsonData)
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
        }

        task.resume()
    }
    
    static func saveCategory(_ category1:String, _ category2:String?, _ category3:String?) {
        defaults.set(category1, forKey: "category1")
        if let category = category2 {
            defaults.set(category, forKey: "category2")
        }
        if let category = category2 {
            defaults.set(category, forKey: "category3")
        }
        postData(state: .update)
    }
    
    static func saveName(_ name:String) {
        defaults.set(name,forKey: "name")
        postData(state: .update)
    }
    
    static func saveDeviceToken(_ token:String) {
            defaults.set(token, forKey: "deviceId")
            saveUUID()
            postData(state: .create)
    }
    static func saveUUID() {
        if let uuid = defaults.string(forKey: "uuid") {
            print(uuid)
        } else {
            defaults.set(NSUUID().uuidString, forKey: "uuid")
        }
    }
}
