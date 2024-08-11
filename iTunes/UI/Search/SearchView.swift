//
//  SearchView.swift
//  iTunes
//
//  Created by 쌩 on 8/11/24.
//

import UIKit

import SnapKit

class SearchView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierachy() {
        self.backgroundColor = .white
        addSubview(tableView)
    }
    private func configureLayout() {
        tableView.backgroundColor = .brown
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
