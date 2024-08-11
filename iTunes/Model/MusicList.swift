//
//  MusicList.swift
//  iTunes
//
//  Created by 쌩 on 8/11/24.
//

import Foundation

struct MusicList: Decodable {
    let results: [Music]
}

struct Music: Decodable {
    let artistName: String
    let trackName: String
    let releaseDate: String
    let country: String
    let primaryGenreName: String
    let artworkUrl100: String
}
