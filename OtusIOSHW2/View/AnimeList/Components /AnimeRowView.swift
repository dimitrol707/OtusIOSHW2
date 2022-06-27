//
//  AnimeRowView.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 27.06.2022.
//

import SwiftUI
import NetworkLayer
import ImageService

struct AnimeRowView: View {
    var anime: Anime
    
    var body: some View {
        HStack {
            ImageView(imageUrl: anime.images?.jpg?.imageUrl ?? "")
                .scaledToFill()
                .frame(width: 100, height: 120)
                .cornerRadius(10)
            Spacer(minLength: 20)
            VStack(alignment: .trailing, spacing: 0) {
                Text(anime.title ?? "Unknown title")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                type
                score
                Spacer()
            }
        }
        .padding()
        .background(
            Color.white
        )
        .cornerRadius(15)
    }
}


extension AnimeRowView {
    
    var type: some View {
        Group {
            HStack(spacing: 0) {
                Text("\(anime.type?.rawValue ?? "unknown type")")
                Text("(\(anime.episodes != nil ? String(describing: anime.episodes!) : "1..."))")
            }
            .font(.caption)
            .foregroundColor(.black)
        }
    }
    
    var score: some View {
        HStack(spacing: 5) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text(anime.score != nil ? String(format: "%.2f" , anime.score!) : "0.00")
                .foregroundColor(.black)
        }
        .font(.caption)
        .padding(.vertical, 4)
    }
}
