//
//  NetworkManager.swift
//  iTunes
//
//  Created by 쌩 on 8/11/24.
//

import Foundation

import RxSwift

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusCodeError
}

class NetworkManager{
    static let shared = NetworkManager()
    private init () {}
    
    func calliTunesData(query: String) -> Observable<MusicList> {
        
        let url = "https://itunes.apple.com/search?term=\(query)&country=kr"
        
        let result = Observable<MusicList>.create { observer in
            
            guard let url = URL(string: url) else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusCodeError)
                    return
                }
                
                if let data = data,
                   let appData = try? JSONDecoder().decode(MusicList.self, from: data) {
                    observer.onNext(appData)
                    observer.onCompleted()
                } else {
                    observer.onError(APIError.unknownResponse)
                }
            }.resume()
            return Disposables.create()
        }.debug("음악조회")
        return result
    }
    
}
