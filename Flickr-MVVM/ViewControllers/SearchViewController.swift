//
//  SearchViewController.swift
//  Flickr-MVVM
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
    }

    private func configureTableView() {
        if let tableView = tableView {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = .white

            tableView.register(UITableViewCell.self, forCellReuseIdentifier: viewModel.reuseIdentifier)
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
        // TODO: - save search + push PhotoCollectionViewController
        resetSearchBar()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetSearchBar()
    }

    private func resetSearchBar() {
        searchBar.resignFirstResponder()
        searchBar.text = nil
    }

}
