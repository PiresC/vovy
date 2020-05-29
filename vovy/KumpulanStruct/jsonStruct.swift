//
//  jsonStruct.swift
//  vovy
//
//  Created by Alfon on 26/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import Foundation

struct dataStructure: Codable {
    let additional_information: [String]
    let activity_category: [String]
    let title: String
    let image: String
    let description: String
    let registration_deadline: String
    let start_date: String
    let end_date: String
    let website_link: String
    let englishNeeded: Bool
    let source: String
}

struct readJson: Codable {
    let status: Int
    let message: String
    var data: [dataStructure]
}

