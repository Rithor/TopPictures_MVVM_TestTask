//
//  PictureDetailCollectionViewModel.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class PictureDetailCollectionViewModel: PictureDetailCollectionViewModelProtocol {
    
    private let networkService = NetworkService()
    var pictureDetailData: PictureDetailData?
    var comments: [CommentData]?
    private var picture: Picture
    
    required init(for picture: Picture) {
        self.picture = picture
    }
    
    func getViewModelData(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            let semaphore = DispatchSemaphore (value: 0)
            self.getPictureDetailData {
                semaphore.signal()
            }
            self.getComments {
                semaphore.signal()
            }
            semaphore.wait()
            semaphore.wait()
            completion()
        }
    }
    
    func numberOfItem() -> Int? {
        return comments?.count ?? 0
    }
    
    func headerViewModel(for indexPath: IndexPath) -> PictureDetailHeaderViewModelProtocol? {
        guard let pictureDetailData = pictureDetailData else { return nil }
        return PictureDetailHeaderViewModel(for: picture, and: pictureDetailData)
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CommentCollectionViewCellViewModelProtocol? {
        guard let comments = comments else { return nil }
        let commentData = comments[indexPath.item]
        return CommentCollectionViewCellViewModel(for: commentData)
    }
    
    private func getPictureDetailData(completion: @escaping () -> Void) {
        networkService.getPictureInfo(for: picture) { [weak self] (pictureDetailData) in
            guard let strongSelf = self else { return }
            strongSelf.pictureDetailData = pictureDetailData
            completion()
        }
    }
    
    private func getComments(completion: @escaping () -> Void) {
        networkService.getComments(for: picture) { [weak self] (commentsData) in
            guard let strongSelf = self else { return }
            strongSelf.comments = commentsData
            completion()
        }
    }
    
}
