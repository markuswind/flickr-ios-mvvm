//
//  PhotoCollectionViewController.swift
//  Flickr-MVVM
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {

   fileprivate let viewModel: PhotoCollectionViewModel!

    // MARK: - Lifecycle

    init(withViewModel: PhotoCollectionViewModel) {
        viewModel = withViewModel
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureCollectionView()
    }

    private func configureNavigationBar() {
        navigationItem.title = viewModel.photosSearchTerm
    }

    private func configureCollectionView() {
        if let collectionView = collectionView {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .white

            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: viewModel.reuseIdentifier)
        }
    }

    // MARK: - User Interaction

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let currentItem = indexPath.row + (indexPath.section * viewModel.itemsPerSection)
        let treshHoldItem = (viewModel.currentPage * viewModel.itemsPerPage) - viewModel.itemsTreshold

        if (currentItem > treshHoldItem) && (viewModel.currentPage < viewModel.totalPages) {
            // TODO: - request new page with images from viewModel && call updateCollectionView on completion
        }
    }

    private func updateCollectionView() {
        DispatchQueue.main.async{
            if let collectionView = self.collectionView {
                if collectionView.numberOfSections == 0 {
                    collectionView.reloadData()
                } else {
                    let numberOfSections = collectionView.numberOfSections
                    let lastIndexOfNewSections = numberOfSections + 2
                    let indexSet = IndexSet(integersIn: numberOfSections...lastIndexOfNewSections)

                    collectionView.insertSections(indexSet)
                }
            }
        }
    }

    // TODO: - Add interactions for lazy loading + opening image

}

// MARK: - UICollectionViewDataSource

extension PhotoCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.photosData.count / viewModel.itemsPerSection
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemsPerSection
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseIdentifier, for: indexPath) as UICollectionViewCell

        return cell
    }

}
