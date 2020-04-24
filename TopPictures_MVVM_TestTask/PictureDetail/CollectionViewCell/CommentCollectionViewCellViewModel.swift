//
//  CommentCollectionViewCellViewModel.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class CommentCollectionViewCellViewModel: CommentCollectionViewCellViewModelProtocol {
    
    private var commentData: CommentData
    
    var autor: String? {
        return commentData.author
    }
    var comment: String? {
        return commentData.comment
    }
    var date: String? {
        let date = Date(timeIntervalSince1970: TimeInterval(commentData.datetime ?? 0))
        let formatter = DateFormatter()
        formatter.dateFormat = "d.MM.y"
        return formatter.string(from: date)
    }
    var upsDowns: String? {
        return "👍🏻 \(commentData.ups ?? 0)  👎🏻 \(commentData.downs ?? 0)"
    }
    
    required init(for commentData: CommentData) {
        self.commentData = commentData
    }
    
}
