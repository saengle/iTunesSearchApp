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
            cell.appNameLabel.text = element
            cell.setImage(imagePath: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/a1/4b/f7/a14bf746-bf45-d729-f6dc-740f00d67b27/dj.mxtqktim.jpg/100x100bb.jpg")
        }
        .disposed(by: disposeBag)
        
    }
    
    private func configureVC() {
        navigationItem.titleView = searchBar
    }
}
