//
//  LocalStorage.swift
//  vovy
//
//  Created by Peter Andrew on 27/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import Foundation
import UIKit

class LocalStorage {
    static let defaults = UserDefaults.standard
    static let BASE_API = "https://mc2-be.herokuapp.com/users/"
    
    enum State {
        case create
        case update
    }
    
    static func getCategories() -> Array<String>{
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
    
    static func getFirstCategory()-> String? {
        return defaults.string(forKey: "category1") 
    }
    
    static func getName() -> String {
        if let name = defaults.string(forKey: "name") {
            return name
        }
        return "nama"
    }
    
    static func getProfileImage() -> UIImage  {
        if let imageData = defaults.data(forKey: "image"),
            let image = UIImage(data: imageData) {
            print(imageData)
            print(image)
            return image
        }
        return #imageLiteral(resourceName: "profileicon")
    }
    
    static func getDescription() -> String {
        if let desc = defaults.string(forKey: "desc") {
            return desc
        }
        return "Deskripsi diri anda"
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
        let category = QuizCategoryConversion.getBEFormatCategory(getCategories())
        
        print(baseParams)
        if(category.count > 0){
            for i in 0...(category.count-1) {
                baseParams += "&category[\(i)]=\(category[i])"
            }
        }
        return baseParams
    }
    
    static func saveCategory(_ categories:Array<String>) {
        resetCategories()
        if categories.count > 0 {
            for i in 0...(categories.count-1) {
                print("category\(i+1)")
                defaults.set(categories[i], forKey: "category\(i+1)")
            }
        }
        postData(state: .update)
    }
    
    static func saveProfileImage(_ image:UIImage) {
        defaults.set(image.pngData(),forKey: "image")
    }
    
    static func saveName(_ name:String) {
        defaults.set(name,forKey: "name")
        postData(state: .update)
    }
    
    static func bulkSave(name:String, desc:String, categories:Array<String>, image:UIImage) {
        resetCategories()
        defaults.set(name,forKey: "name")
        defaults.set(desc,forKey: "desc")
        if categories.count > 0 {
            for i in 0...(categories.count-1) {
                print("\(categories[i]) ke\(i) with key \("category\(i+1)")")
                defaults.set(categories[i], forKey: "category\(i+1)")
            }
        }
        defaults.set(image.pngData(),forKey: "image")
        postData(state: .update)
    }
    
    private static func resetCategories() {
        var i = 1;
        while(defaults.string(forKey: "category\(i)") != nil) {
            defaults.removeObject(forKey: "category\(i)")
            i+=1
        }
    }
    
    static func saveDescription(_ desc:String){
        defaults.set(desc,forKey: "desc")
    }
    
    static func saveDeviceToken(_ token:String) {
        defaults.set(token, forKey: "deviceId")
        print(token+" sosial pliss")
        if defaults.string(forKey: "deviceId") != nil {
            postData(state: .update)
        } else {
            postData(state: .create)
        }
    }
}

