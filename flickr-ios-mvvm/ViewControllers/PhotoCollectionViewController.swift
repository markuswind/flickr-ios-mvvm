//
//  PhotoCollectionViewController.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import AlamofireImage
import UIKit

class PhotoCollectionViewController: UICollectionViewController {

  // MARK: Properties

  fileprivate let viewModel: PhotoCollectionViewModel!
  fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)

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

    collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewModel.reuseIdentifier)
  }

  override func viewDidAppear(_ animated: Bool) {
    viewModel.requestNextPhotosPage(completion: updateCollectionView)
  }

  // MARK: - Lazy Loading

  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    let itemsPerPage = PhotoCollectionViewModel.itemsPerPage
    let itemsPerSection = PhotoCollectionViewModel.itemsPerSection
    let itemsTreshold = PhotoCollectionViewModel.itemsTreshold

    let currentItem = indexPath.row + (indexPath.section * itemsPerSection)
    let treshHoldItem = (viewModel.currentPage * itemsPerPage) - itemsTreshold

    if (currentItem > treshHoldItem) && (viewModel.currentPage < viewModel.totalPages) {
      viewModel.requestNextPhotosPage(completion: updateCollectionView)
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

  // MARK: - Simple Fullscreen Image

  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedCell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
    let imageView = selectedCell.imageView

    showFullscreenImage(image: imageView.image!)
  }

  private func showFullscreenImage(image: UIImage) {
    let tap = UITapGestureRecognizer(target: self, action: #selector(PhotoCollectionViewController.dismissFullscreenImage))
    let imageView = UIImageView(image: image)

    imageView.frame = UIScreen.main.bounds
    imageView.backgroundColor = .black
    imageView.contentMode = .scaleAspectFit
    imageView.isUserInteractionEnabled = true
    imageView.addGestureRecognizer(tap)

    view.addSubview(imageView)
    navigationController?.isNavigationBarHidden = true
  }

  @objc
  fileprivate func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
    self.navigationController?.isNavigationBarHidden = false

    sender.view?.removeFromSuperview()
  }

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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewModel.reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell

    let index = indexPath.row + (indexPath.section * PhotoCollectionViewModel.itemsPerSection)
    let imageURL = viewModel.photosData[index].imageURL()

    cell.imageView.image = nil
    cell.imageView.af_setImage(withURL: URL(string: imageURL)!)

    return cell
  }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {

  // FIXME: - fix updating width/height when rotating screen
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemsPerRow = CGFloat(PhotoCollectionViewModel.itemsPerRow)
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)

    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow

    return CGSize(width: widthPerItem, height: widthPerItem)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }

}

