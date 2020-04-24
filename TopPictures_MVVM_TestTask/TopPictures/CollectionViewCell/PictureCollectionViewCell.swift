//
//  PictureCollectionViewCell.swift
//  TopPictures_TestTask
//
//  Created by Vitalii on 17.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureImageView: CachedImageView!
    
    static let pictureCellIdentifire = "pictureCell"
    
    var viewModel: PictureCollectionViewCellViewModelProtocol! {
        didSet {
            titleLabel?.text = viewModel.titleLabel
            pictureImageView.loadImage(urlString: viewModel.pictureImageViewLink)
        }
    }

}
