//
//  SearchViewController.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate {

    fileprivate let viewModel: SearchViewModel!

    let searchBar = UISearchBar()

    // MARK: - Lifecycle

    init(withViewModel: SearchViewModel) {
        viewModel = withViewModel

        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureSearchBar()

        viewModel.retrieveInitialSearchData(completion: updateTableView)
    }

    private func configureTableView() {
        if let tableView = tableView {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = .white

            tableView.register(SearchViewCell.self, forCellReuseIdentifier: SearchViewModel.reuseIdentifier)
        }
    }

    private func configureSearchBar() {
        searchBar.delegate = self
        searchBar.searchBarStyle = .default
        searchBar.showsCancelButton = true
        searchBar.tintColor = UIColor.lightGray
        searchBar.placeholder = "Search..."

        navigationItem.titleView = searchBar
    }

    // MARK: - User Interaction

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            viewModel.saveSearch(text: searchText, completion: updateTableView)

            pushPhotoCollectionViewController(searchText: searchText)
            resetSearchBar()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetSearchBar()
    }

    private func resetSearchBar() {
        searchBar.resignFirstResponder()
        searchBar.text = nil
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushPhotoCollectionViewController(searchText: viewModel.searchData[indexPath.row])
    }

    // MARK - View Interaction

    private func pushPhotoCollectionViewController(searchText: String) {
        let viewModel = PhotoCollectionViewModel(searchText: searchText)
        let viewController = PhotoCollectionViewController(withViewModel: viewModel)

        navigationController?.pushViewController(viewController, animated: true)
    }

    private func updateTableView() {
        // TODO: - insert new row instead of reloading?
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension SearchViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewModel.reuseIdentifier, for: indexPath) as! SearchViewCell
        cell.textLabel!.text = viewModel.searchData[indexPath.row]

        return cell
    }

}
