//
//  Comments.swift
//  TopPictures_TestTask
//
//  Created by Vitalii on 20.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class Comments: Decodable {
    let data: [CommentData]?
    let success: Bool?
    let status: Int?
}

class CommentData: Decodable {
    let comment: String?
    let author: String?
    let datetime: Int?
    let ups: Int?
    let downs: Int?
}
