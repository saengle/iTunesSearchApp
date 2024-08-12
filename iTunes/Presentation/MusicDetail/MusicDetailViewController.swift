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
    
    var myMusic: [Music] = []
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = myMusic.first?.trackName
        detailView.configureView(data: myMusic.first ?? Music(artistName: "", trackName: "", releaseDate: "", country: "", primaryGenreName: "", artworkUrl100: ""))
    }
}
