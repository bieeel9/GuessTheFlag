//
//  BigTitleViewModifier.swift
//  GuessTheFlag
//
//  Created by Gabriel Santos on 31/03/25.
//

import SwiftUI

struct BigTitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
    }
}

extension View {
    func bigTitleStyle() -> some View {
        modifier(BigTitleViewModifier())
    }
}
