//
//  CardView.swift
//  SlotGame
//
//  Created by Akshay Singh on 29/05/25.
//

import SwiftUI

struct CardView: View {
    @Binding var symbol : String
    @Binding var background : Color
    var body: some View {
        VStack {
            Image(symbol)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .background(background.opacity(0.5))
                .cornerRadius(20)
        }
    }
}

#Preview {
    CardView(symbol: Binding.constant("apple"), background: Binding.constant(Color.white))
}
