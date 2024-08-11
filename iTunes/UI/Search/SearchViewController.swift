//
//  SearchViewController.swift
//  iTunes
//
//  Created by 쌩 on 8/11/24.
//

import UIKit

import SnapKit
import RxCocoa
import RxSwift

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    let searchBar = UISearchBar()
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
}

extension SearchViewController {
    private func configureVC() {
        navigationItem.titleView = searchBar
    }
}
