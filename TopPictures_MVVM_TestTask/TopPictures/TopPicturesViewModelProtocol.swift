//
//  TopPicturesViewModelProtocol.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

protocol TopPicturesViewModelProtocol {
    
    var pictures: [Picture] { get }
    
    func getPictures(completion: @escaping() -> Void)
    func numberOfItem() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> PictureCollectionViewCellViewModelProtocol?
    func viewModelForSelectedItem(at indexPath: IndexPath) -> PictureDetailCollectionViewModelProtocol?
    
}
