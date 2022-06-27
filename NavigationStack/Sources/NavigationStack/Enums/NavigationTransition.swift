//
//  NavigationTransition.swift
//  
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI


public enum NavigationTransition {
    case none
    case `default`
    case custom(AnyTransition)
    
    public static var defaultTransition: (push: AnyTransition, pop: AnyTransition) {
        let pushTransition = AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
        let popTransition = AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
        
        return (pushTransition, popTransition)
    }
}
