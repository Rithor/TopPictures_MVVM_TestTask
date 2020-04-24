//
//  PictureDetailHeader.swift
//  TopPictures_TestTask
//
//  Created by Vitalii on 19.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import UIKit

class PictureDetailHeader: UICollectionReusableView {
    
    static let headerIdentifier = "headerID"
    
    @IBOutlet weak var pictureImageView: CachedImageView!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    var viewModel: PictureDetailHeaderViewModelProtocol? {
        didSet {
            widthLabel.text = viewModel?.width
            heightLabel.text = viewModel?.height
            sizeLabel.text = viewModel?.size
            addedLabel.text = viewModel?.added
            viewsLabel.text = viewModel?.viewsCount
            pictureImageView.loadImage(urlString: viewModel?.pictureLink)
        }
    }
    
}
