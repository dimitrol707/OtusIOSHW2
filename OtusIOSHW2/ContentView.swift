//
//  ContentView.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI
import NavigationStack

struct ContentView: View {
    
    var body: some View {
        NavigationStackView {
            AnimeListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
