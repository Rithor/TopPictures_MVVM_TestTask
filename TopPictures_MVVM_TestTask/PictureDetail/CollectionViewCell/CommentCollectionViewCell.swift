//
//  CommentCollectionViewCell.swift
//  TopPictures_TestTask
//
//  Created by Vitalii on 20.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    
    static let commentIdentifire = "commentID"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var upsDownsLabel: UILabel!
    @IBOutlet weak var leadingCommentLabelConstraint: NSLayoutConstraint!
    
    var viewModel: CommentCollectionViewCellViewModelProtocol? {
        didSet {
            self.autorLabel.text = viewModel?.autor
            self.commentLabel.text = viewModel?.comment
            self.dateLabel.text = viewModel?.date
            self.upsDownsLabel.text = viewModel?.upsDowns
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        let calculateValue = UIScreen.main.bounds.size.width - Constant.padding * 2 - leadingCommentLabelConstraint.constant
        let commentLabelWidthAnchor = commentLabel.widthAnchor.constraint(equalToConstant: calculateValue)
        commentLabelWidthAnchor.isActive = true
        commentLabelWidthAnchor.priority = UILayoutPriority(rawValue: 750)
        
        autorLabel.translatesAutoresizingMaskIntoConstraints = false
        let autorLabelWidthAnchor = commentLabel.widthAnchor.constraint(equalToConstant: calculateValue)
        autorLabelWidthAnchor.isActive = true
        autorLabelWidthAnchor.priority = UILayoutPriority(rawValue: 750)
    }
    
}
