//
//  PictureDetailHeaderViewModelProtocol.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

protocol PictureDetailHeaderViewModelProtocol {
    
    var pictureLink: String? { get }
    var width: String? { get }
    var height: String? { get }
    var size: String? { get }
    var added: String? { get }
    var viewsCount: String? { get }
    
    init(for picture: Picture, and pictureDetailData: PictureDetailData)
    
}
