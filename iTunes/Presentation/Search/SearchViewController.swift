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
    let vm = SearchViewModel()
    
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
        
        let input = SearchViewModel.Input(searchButtonTap: self.searchBar.rx.searchButtonClicked, searchText: searchBar.rx.text.orEmpty)
        
        let output = vm.transform(input: input)
        
        output.musicList.bind(to: searchView.tableView.rx.items(cellIdentifier: SearchTableViewCell.id, cellType: SearchTableViewCell.self)) { (row, element, cell) in
            cell.songNameLabel.text = element.trackName
            cell.artistNameLabel.text = element.artistName
            cell.setImage(imagePath: element.artworkUrl100)
        }
        .disposed(by: disposeBag)
    }
    
    private func configureVC() {
        navigationItem.titleView = searchBar
    }
}
