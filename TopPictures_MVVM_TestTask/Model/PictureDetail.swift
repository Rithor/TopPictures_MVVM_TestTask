//
//  PictureDetail.swift
//  TopPictures_TestTask
//
//  Created by Vitalii on 19.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class PictureDetail: Decodable {
    let data: PictureDetailData?
    let success: Bool?
    let status: Int?
}

class PictureDetailData: Decodable {
    let width: Int?
    let height: Int?
    let size: Int?
    let datetime: Int?
    let views: Int?
}
