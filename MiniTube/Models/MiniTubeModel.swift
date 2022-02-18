//
//  MiniTubeModel.swift
//  MiniTube
//
//  Created by sergio shaon on 18/2/22.
//

import Foundation

struct MiniTubeModel: Codable{
    let page: Int
    let perPage: Int
    let totalResults: Int
    let url: String
    let videos: [Video]
}

struct Video: Codable, Identifiable {
    let id: Int
    let image: String
    let duration: Int
    let user: User
    let videoFiles: [VideoFiles]
}

struct VideoFiles: Codable, Identifiable{
    let id: Int
    let link: String
}

struct User: Codable, Identifiable{
    let id: Int
    let name: String
    let url: String
}


