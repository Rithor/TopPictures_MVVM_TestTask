//
//  CommentCollectionViewCellViewModelProtocol.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

protocol CommentCollectionViewCellViewModelProtocol {
    
    var autor: String? { get }
    var comment: String? { get }
    var date:  String? { get }
    var upsDowns: String? { get }
    
    init(for commentData: CommentData)
    
}
