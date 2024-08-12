//
//  MusicDetailView.swift
//  iTunesSearch
//
//  Created by 쌩 on 8/11/24.
//

import UIKit

import SnapKit

final class MusicDetailView: UIView {
    
    private let artistNameLabel = {
        let lb = UILabel()
        
        return lb
    }()
    private let trackNameLabel = {
        let lb = UILabel()
        
        return lb
    }()
    private let releaseDateLabel = {
        let lb = UILabel()
        
        return lb
    }()
    private let artistCountryLabel = {
        let lb = UILabel()
        
        return lb
    }()
    private let genreLabel = {
        let lb = UILabel()
        
        return lb
    }()
    private let albumImageView = {
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
        
        trackNameLabel.snp.makeConstraints { make in
            
        }
        
        artistNameLabel.snp.makeConstraints { make in
            
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            
        }
        
        artistCountryLabel.snp.makeConstraints { make in
            
        }
        
        genreLabel.snp.makeConstraints { make in
            
        }
    }
    
    func configureView(data: Music) {
        artistNameLabel.text = data.artistName
        trackNameLabel.text = data.trackName
        releaseDateLabel.text = data.releaseDate
        artistCountryLabel.text = data.country
        genreLabel.text = data.primaryGenreName
        albumImageView.setMyImage(imagePath: data.artworkUrl100)
    }
}
