//
//  Gallery.swift
//  TopPictures_TestTask
//
//  Created by Vitalii on 18.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class Gallery: Decodable {
    let data: [GalleryData]?
    let success: Bool?
    let status: Int?
}

class GalleryData: Decodable {
    let id: String?
    let title: String?
    let comment_count: Int?
    let images: [Image]?
}

class Image: Decodable {
    let id: String?
    let link: String?
    let type: String?
}
