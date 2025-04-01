//
//  FlagImageView.swift
//  GuessTheFlag
//
//  Created by Gabriel Santos on 31/03/25.
//

import SwiftUI

struct FlagImageView: View {
    
    var imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .clipShape(.rect(cornerRadii: .init(topLeading: 20, bottomTrailing: 20)))
                .shadow(radius: 5)
        }
    }
}

#Preview {
    FlagImageView(imageName: "")
}
