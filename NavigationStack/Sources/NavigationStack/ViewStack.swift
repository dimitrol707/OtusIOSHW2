//
//  ViewStack.swift
//  
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI

public struct ViewStack {
    private var views: [ViewStackElement] = .init()
    
    public mutating func push(_ element: ViewStackElement) {
        guard indexForIdView(element.id) == nil else { return }
        views.append(element)
    }
    
    public mutating func pop() {
        _ = views.removeLast()
    }
    
    public mutating func popToRoot() {
        views.removeAll()
    }
    
    public func indexForIdView(_ id: String) -> Int? {
        views.firstIndex { $0.id == id}
    }
    
    public func lastView() -> ViewStackElement? {
        views.last
    }
}
