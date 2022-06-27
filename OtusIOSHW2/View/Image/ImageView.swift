//
//  ImageView.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject private var imageVM: ImageViewModel
    
    init(imageUrl: String) {
        imageVM = .init(imageUrl: imageUrl)
    }
    
    var body: some View {
        
        Group {
            if let image = imageVM.image {
                Image(uiImage: image)
                    .resizable()
            } else if imageVM.isLoading {
                GeometryReader {
                    proxy in
                    ProgressView()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                }
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.secondary)
            }
        }
            
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageUrl: "https://cdn.myanimelist.net/images/characters/11/294388.jpg?s=a56fc5484b23811f3308aad1dc7b8b2e2")
    }
}


