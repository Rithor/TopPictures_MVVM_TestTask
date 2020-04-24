//
//  PictureCollectionViewCellViewModelProtocol.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

protocol PictureCollectionViewCellViewModelProtocol {
    
    var pictureImageViewLink: String { get }
    var titleLabel: String? { get }
    
    init(for picture: Picture)
    
}
