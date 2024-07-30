//
//  DetailView.swift
//  MovieList
//
//  Created by Udkar Bittu on 26/07/24.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var favorites: Favorites
    let anime: AnimeMovieModel

    var body: some View {
        ScrollView {
            VStack(spacing: 2) {
                Image(anime.imgName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                
                Text(anime.title)
                    .font(.headline)
                
                Text(anime.subTitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(anime.description)
                    .font(.body)
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                Button(action: {
                    if favorites.contains(anime) {
                        favorites.remove(anime)
                    } else {
                        favorites.add(anime)
                    }
                }) {
                    Text(favorites.contains(anime) ? "Remove from Favorites" : "Add to Favorites")
                        .foregroundColor(.white)
                        .padding()
                        .background(favorites.contains(anime) ? Color.red : Color.blue)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            }
            .padding(5)
            .navigationTitle(anime.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    DetailView()
//}
