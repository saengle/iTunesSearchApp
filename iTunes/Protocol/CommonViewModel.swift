//
//  CommonViewModel.swift
//  iTunesSearch
//
//  Created by 쌩 on 8/12/24.
//

import Foundation

protocol CommonViewModel {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
