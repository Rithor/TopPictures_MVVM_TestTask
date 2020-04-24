//
//  TopPicturesCollectionViewController.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import UIKit

class TopPicturesCollectionViewController: UICollectionViewController {
    
    var activityIndicator: ProgressView?
    private var viewModel: TopPicturesViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        setupLayout()
    }
    
    fileprivate func setupUI() {
        viewModel = TopPicturesViewModel()
        viewModel.getPictures {
            DispatchQueue.main.async {
                self.activityIndicator?.hideProgressView()
                self.collectionView.performBatchUpdates({
                    let indexSet = IndexSet(integersIn: 0...0)
                    self.collectionView.reloadSections(indexSet)
                }, completion: nil)
            }
        }
        activityIndicator = ProgressView(at: view)
        activityIndicator?.showProgressView()
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.scrollIndicatorInsets = .init(top: 0.0, left: 0.0,
                                                     bottom: 1.0, right: 0.0)
        title = Constant.appName
    }
    
    fileprivate func registerCells() {
        collectionView.register(UINib(nibName: String(describing: PictureCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: PictureCollectionViewCell.pictureCellIdentifire)
    }
    
    fileprivate func setupLayout() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
    }
    
    //MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pictureDetailCVC = PictureDetailCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        pictureDetailCVC.viewModel = viewModel.viewModelForSelectedItem(at: indexPath)
        present(pictureDetailCVC, animated: true, completion: nil)
    }
    
    //MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItem() ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.pictureCellIdentifire, for: indexPath) as? PictureCollectionViewCell
        assert(cell != nil, "Could not cast value of type \(UICollectionViewCell.self) to \(PictureCollectionViewCell.self)")
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell?.viewModel = cellViewModel
        return cell ?? UICollectionViewCell()
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension TopPicturesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let safeAreaInsets = collectionView.safeAreaInsets
        let calculateHeight = collectionView.frame.height - safeAreaInsets.top - safeAreaInsets.bottom
        return .init(width: collectionView.frame.width,
                     height: calculateHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
