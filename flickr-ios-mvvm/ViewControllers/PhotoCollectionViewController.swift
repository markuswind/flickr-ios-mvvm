//
//  PhotoCollectionViewController.swift
//  flickr-ios-mvvm
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
    navigationItem.title = viewModel.photosSearchText
  }

  private func configureCollectionView() {
    guard let collectionView = collectionView else {
      fatalError("collectionView could not be found")
    }

    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = Color.backgroundColor

    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewModel.reuseIdentifier)
  }

  override func viewDidAppear(_ animated: Bool) {
    viewModel.requestNextPhotosPage(completion: updateCollectionView)
  }

  // MARK: - User Interaction

  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    let itemsPerPage = PhotoCollectionViewModel.itemsPerPage
    let itemsPerSection = PhotoCollectionViewModel.itemsPerSection
    let itemsTreshold = PhotoCollectionViewModel.itemsTreshold

    let currentItem = indexPath.row + (indexPath.section * itemsPerSection)
    let treshHoldItem = (viewModel.currentPage * itemsPerPage) - itemsTreshold

    if (currentItem > treshHoldItem) && (viewModel.currentPage < viewModel.totalPages) {
//      viewModel.requestNextPhotosPage(completion: updateCollectionView)
    }
  }

  private func updateCollectionView() {
    DispatchQueue.main.async{
      guard let collectionView = self.collectionView else {
        fatalError("self.collectionView could not be found")
      }

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

  // TODO: - Add interaction for opening image(s)

}

// MARK: - UICollectionViewDataSource

extension PhotoCollectionViewController {

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return viewModel.photosData.count / PhotoCollectionViewModel.itemsPerSection
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return PhotoCollectionViewModel.itemsPerSection
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewModel.reuseIdentifier, for: indexPath) as UICollectionViewCell

    return cell
  }

}
