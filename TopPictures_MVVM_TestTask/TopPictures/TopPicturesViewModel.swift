//
//  TopPicturesViewModel.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class TopPicturesViewModel: TopPicturesViewModelProtocol {
    
    private let networkService = NetworkService()
    private (set) var pictures: [Picture] = []
    
    func getPictures(completion: @escaping () -> Void) {
        networkService.getGallery { [weak self] pictures in
            guard let strongSelf = self else { return }
            guard let picturesArray = pictures else {
                assert(pictures != nil, "networkService.getGallery did failure")
                return
            }
            strongSelf.pictures = picturesArray
            completion()
        }
    }
    
    func numberOfItem() -> Int? {
        return pictures.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> PictureCollectionViewCellViewModelProtocol? {
        let picture = pictures[indexPath.item]
        return PictureCollectionViewCellViewModel(for: picture)
    }
    
    func viewModelForSelectedItem(at indexPath: IndexPath) -> PictureDetailCollectionViewModelProtocol? {
        let picture = pictures[indexPath.item]
        return PictureDetailCollectionViewModel(for: picture)
    }
    
}
