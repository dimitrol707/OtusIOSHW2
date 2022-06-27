//
//  ViewStackElement.swift
//  
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI

public struct ViewStackElement: Identifiable, Equatable {
    public let id: String = UUID().uuidString
    public let view: AnyView
    
    public static func == (lhs: ViewStackElement, rhs: ViewStackElement) -> Bool {
        lhs.id == rhs.id
    }
}
