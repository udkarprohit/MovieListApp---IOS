//
//  Favorites.swift
//  MovieList
//
//  Created by Udkar Bittu on 28/07/24.
//

import SwiftUI
import Combine

class Favorites: ObservableObject {
    @Published var items: Set<Int> = []
    
    func contains(_ anime: AnimeMovieModel) -> Bool {
        items.contains(anime.id)
    }
    
    func add(_ anime: AnimeMovieModel) {
        items.insert(anime.id)
    }
    
    func remove(_ anime: AnimeMovieModel) {
        items.remove(anime.id)
    }
}


