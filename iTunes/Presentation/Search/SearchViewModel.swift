//
//  SearchViewModel.swift
//  iTunes
//
//  Created by 쌩 on 8/11/24.
//

import Foundation

import RxSwift
import RxCocoa

class SearchViewModel {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let searchButtonTap: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    struct Output {
        let musicList: PublishSubject<[Music]>
    }
    
    func transform(input: Input) -> Output {
        
        let searchedMusicList = PublishSubject<[Music]>()
        
        input.searchButtonTap
            .throttle(.seconds(1), scheduler: MainScheduler.asyncInstance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .map { return "\($0)" }
            .flatMap { NetworkManager.shared.calliTunesData(query: $0) }
            .subscribe(with: self) { owner, list in
                searchedMusicList.onNext(list.results)
            } onError: { owner, error in
                print("error")
            } onCompleted: { owner in
                print("completed")
            } onDisposed: { owner in
                print("disposed")
            }
            .disposed(by: disposeBag)
        
        return Output(musicList: searchedMusicList)
    }
}
