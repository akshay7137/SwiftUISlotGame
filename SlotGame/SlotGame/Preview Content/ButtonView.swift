//
//  ButtonView.swift
//  SlotGame
//
//  Created by Akshay Singh on 29/05/25.
//

import SwiftUI

struct ButtonView: View {
    @Binding var buttonView : String
    var body: some View {
        VStack {
            Text(buttonView)
                .bold()
                .foregroundColor(.white)
                .padding(.all,10)
                .padding([.leading,.trailing],30)
                .background(Color.pink)
                .cornerRadius(20)
        }
    }
}

#Preview {
    ButtonView(buttonView: Binding.constant("Spin"))
}
