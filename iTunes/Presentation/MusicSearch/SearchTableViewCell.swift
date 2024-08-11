//
//  SearchTableViewCell.swift
//  iTunes
//
//  Created by 쌩 on 8/11/24.
//

import UIKit

import RxSwift
import SnapKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {
    
    static let id = "SearchTableViewCell"
    
    let songNameLabel: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    
    let artistNameLabel: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    let albumImageView = UIImageView()
    
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag() // 재사용 셀
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(songNameLabel)
        contentView.addSubview(albumImageView)
        contentView.addSubview(artistNameLabel)
        
        albumImageView.snp.makeConstraints {
            $0.top.bottom.equalTo(contentView).inset(8)
            $0.leading.equalTo(20)
            $0.size.equalTo(60)
        }
        
        songNameLabel.snp.makeConstraints {
            $0.top.equalTo(albumImageView).inset(8)
            $0.leading.equalTo(albumImageView.snp.trailing).offset(16)
        }
        
        artistNameLabel.snp.makeConstraints {
            $0.top.equalTo(songNameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(albumImageView.snp.trailing).offset(16)
        }
    }
}

