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
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        bind()
    }
}

extension SearchViewController {
    
    private func bind() {
        let tempData = ["안녕", "디지몬"]
        
        let myList = BehaviorSubject(value: tempData)
        myList.bind(to: searchView.tableView.rx.items(cellIdentifier: SearchTableViewCell.id, cellType: SearchTableViewCell.self)) { (row, element, cell) in
            cell.appNameLabel.text = element}
        .disposed(by: disposeBag)
        
    }
    
    private func configureVC() {
        navigationItem.titleView = searchBar
    }
}
