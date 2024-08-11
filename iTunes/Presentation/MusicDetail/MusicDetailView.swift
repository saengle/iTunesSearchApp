//
//  MusicDetailView.swift
//  iTunesSearch
//
//  Created by 쌩 on 8/11/24.
//

import UIKit

import SnapKit

class MusicDetailView: UIView {
    
    let artistNameLabel = {
        let lb = UILabel()
        
        return lb
    }()
    let trackNameLabel = {
        let lb = UILabel()
        
        return lb
    }()
    let releaseDateLabel = {
        let lb = UILabel()
        
        return lb
    }()
    let artistCountryLabel = {
        let lb = UILabel()
        
        return lb
    }()
    let genreLabel = {
        let lb = UILabel()
        
        return lb
    }()
    let albumImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierachy() {
        [artistNameLabel,
         trackNameLabel,
         releaseDateLabel,
         artistCountryLabel,
         genreLabel,
         albumImageView
        ].forEach{addSubview($0)}
    }
    
    private func configureLayout() {
        albumImageView.backgroundColor = .blue
        let screenWidth = frame.width - 16
        albumImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(300)
        }
    }
}
