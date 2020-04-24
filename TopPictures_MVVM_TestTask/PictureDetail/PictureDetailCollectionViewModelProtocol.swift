//
//  PictureDetailCollectionViewModelProtocol.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

protocol PictureDetailCollectionViewModelProtocol {
    
    var comments: [CommentData]? { get }
    var pictureDetailData: PictureDetailData? { get }
    
    func getViewModelData(completion: @escaping () -> Void)
    func numberOfItem() -> Int?
    func headerViewModel(for indexPath: IndexPath) -> PictureDetailHeaderViewModelProtocol?
    func cellViewModel(for indexPath: IndexPath) -> CommentCollectionViewCellViewModelProtocol?
    
    init(for picture: Picture)
    
}
