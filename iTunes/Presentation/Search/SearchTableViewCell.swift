//
//  SearchTableViewCell.swift
//  iTunes
//
//  Created by 쌩 on 8/11/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {
    
    static let id = "SearchTableViewCell"
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let appIconImageView = UIImageView()
    
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
        contentView.addSubview(appNameLabel)
        contentView.addSubview(appIconImageView)
        
        appIconImageView.snp.makeConstraints {
            $0.top.bottom.equalTo(contentView).inset(8)
            $0.leading.equalTo(20)
            $0.size.equalTo(60)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(16)
        }
    }
    func setImage(imagePath: String) {
        if let url = URL(string: "\(String(describing: imagePath))") {
            let processor = DownsamplingImageProcessor(size:  appIconImageView.bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: CGFloat(8))
            appIconImageView.kf.indicatorType = .activity
            appIconImageView.kf.setImage(
                with: url,
                options: [.processor(processor),
                          .scaleFactor(UIScreen.main.scale),
                          .transition(.fade(1)),
                          .cacheOriginalImage])
        }
    }
}

