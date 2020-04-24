//
//  PictureDetailCollectionViewController.swift
//  TopPictures_TestTask
//
//  Created by Vitalii on 19.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import UIKit

class PictureDetailCollectionViewController: UICollectionViewController {
    
    var viewModel: PictureDetailCollectionViewModelProtocol!
    var activityIndicator: ProgressView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        setupLayout()
    }
    
    fileprivate func setupUI() {
        collectionView.backgroundColor = .white
        activityIndicator = ProgressView(at: collectionView)
        activityIndicator?.showProgressView()
        viewModel.getViewModelData {
            DispatchQueue.main.async {
                self.activityIndicator?.hideProgressView()
                self.collectionView.performBatchUpdates({
                    let indexSet = IndexSet(integersIn: 0...0)
                    self.collectionView.reloadSections(indexSet)
                }, completion: nil)
            }
        }
    }
    
    fileprivate func registerCells() {
        collectionView.register(UINib(nibName: String(describing: CommentCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: CommentCollectionViewCell.commentIdentifire)
        collectionView.register(UINib(nibName: String(describing: PictureDetailHeader.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PictureDetailHeader.headerIdentifier)
    }
    
    fileprivate func setupLayout() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension PictureDetailCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItem() ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCollectionViewCell.commentIdentifire, for: indexPath) as? CommentCollectionViewCell
        assert(cell != nil, "Could not cast value of type \(UICollectionViewCell.self) to \(CommentCollectionViewCell.self)")
        cell?.viewModel = viewModel.cellViewModel(for: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let pictureInfoHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PictureDetailHeader.headerIdentifier, for: indexPath) as? PictureDetailHeader
        assert(pictureInfoHeader != nil, "Could not cast value of type \(UICollectionReusableView.self) to \(PictureDetailHeader.self)")
        pictureInfoHeader?.viewModel = viewModel.headerViewModel(for: indexPath)
        return pictureInfoHeader ?? UICollectionReusableView()
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PictureDetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: Constant.padding, left: Constant.padding,
                     bottom: Constant.padding, right: Constant.padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width,
                     height: collectionView.frame.height * 0.23)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.padding
    }
    
}
