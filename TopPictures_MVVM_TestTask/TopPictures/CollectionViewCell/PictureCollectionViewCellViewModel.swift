//
//  PictureCollectionViewCellViewModel.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class PictureCollectionViewCellViewModel: PictureCollectionViewCellViewModelProtocol {
    
    private var picture: Picture
    var pictureImageViewLink: String {
        return picture.link
    }
    var titleLabel: String? {
        return picture.title
    }
    
    required init(for picture: Picture) {
        self.picture = picture
    }
    
}
