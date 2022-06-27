//
//  CharacterItemView.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 27.06.2022.
//


import SwiftUI
import NavigationStack
import NetworkLayer

struct CharacterItemView: View {
    @EnvironmentObject private var navStackVM: NavigationStackViewModel
    @ObservedObject private var charItemVM: CharacterItemViewModel
    
    init(idCharacter: Int?) {
        charItemVM = .init(idCharacter: idCharacter)
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                ImageView(imageUrl: charItemVM.character?.images?.jpg?.imageUrl ?? "")
                    .scaledToFit()
                    .transformEffect(.init(scaleX: 1.1, y: 1.1))
                    .offset(x: -10, y: -10)
                    .clipShape(Rectangle())
                VStack(alignment: .leading) {
                    Text(charItemVM.character?.name ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(charItemVM.character?.about ?? "")
                }
                .padding()
            }
            .padding(.bottom, 60)
            .edgesIgnoringSafeArea([.top, .leading, .trailing])
            .onAppear {
                charItemVM.fetchCharacter()
            }
            Group {
                VStack {
                    HStack {
                        Button {
                            DispatchQueue.main.async {
                                navStackVM.pop()
                            }
                        } label: {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .padding()
                                .background(
                                    Circle()
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 4, x: 1.5, y: 1.5)
                                )
                        }
                        .padding(10)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        
    }
}


