//
//  MusicDetailViewController.swift
//  iTunesSearch
//
//  Created by 쌩 on 8/11/24.
//

import UIKit

import RxCocoa
import RxSwift

class MusicDetailViewController: UIViewController {
    
    let detailView = MusicDetailView()
    
    var titleName = String()
    var albumPath = String()
    var artistName = String()
    var date = String()
    var country = String()
    var genre = String()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = titleName
    }
}
