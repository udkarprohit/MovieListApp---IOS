//
//  ContentView.swift
//  MovieList
//
//  Created by Udkar Bittu on 23/07/24.
//

import SwiftUI

struct AnimeMovieModel: Identifiable, Codable {
    let id: Int
    let imgName: String
    let title: String
    let subTitle: String
    let description: String
    
    static func loadAnimeList() -> [AnimeMovieModel] {
        // If the URL for the JSON file is not found, the function returns a failure with the
        guard let url = Bundle.main.url(forResource: "anime", withExtension: "json") else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode([AnimeMovieModel].self, from: data)
        } catch {
            print("Error loading JSON")
            return []
        }
    }
}

struct ContentView: View {
    
    let arrAnimeList = AnimeMovieModel.loadAnimeList()
    @StateObject private var favorites = Favorites()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(arrAnimeList) { anime in
                    AnimeMovieListView(anime: anime)
                        .environmentObject(favorites)
                }
            }
            .navigationTitle("Top 10 Animes")
        }
        .environmentObject(favorites)
    }
}

struct AnimeMovieListView: View {
    
    @EnvironmentObject var favorites: Favorites
    let anime: AnimeMovieModel

    var body: some View {
        NavigationLink(destination: DetailView(anime: anime)) {
            VStack(alignment: .leading) {
                HStack {
                    Image(anime.imgName)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text(anime.title)
                            .font(.headline)
                        Text(anime.subTitle)
                            .font(.subheadline)
                    }
                    .padding(8)
                    
                    Spacer()
                                        
                    Button(action: {
                        if favorites.contains(anime) {
                            favorites.remove(anime)
                        } else {
                            favorites.add(anime)
                        }
                    }) {
                        Image(systemName: favorites.contains(anime) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
