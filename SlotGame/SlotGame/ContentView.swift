//
//  ContentView.swift
//  SlotGame
//
//  Created by Akshay Singh on 28/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["apple","cherry","star","lemon","donut","diamond","seven","watermelon","bell"]
    @State private var numbers = [0,1,2,3,4,5,6,7,8]
    @State private var credits = 1000
    @State private var background = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]
    @State private var buttonTextView = "Middle Spin"
    @State private var fullButtonSpin = "Full Spin"
    private var betAmount = 5
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Slot Game !")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
                Text("Credits : " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        CardView(symbol: $symbols[numbers[0]], background: $background[numbers[0]])
                        CardView(symbol: $symbols[numbers[1]], background: $background[numbers[1]])
                        CardView(symbol: $symbols[numbers[2]], background: $background[numbers[2]])
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[3]], background: $background[numbers[3]])
                        CardView(symbol: $symbols[numbers[4]], background: $background[numbers[4]])
                        CardView(symbol: $symbols[numbers[5]], background: $background[numbers[5]])
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        CardView(symbol: $symbols[numbers[6]], background: $background[numbers[6]])
                        CardView(symbol: $symbols[numbers[7]], background: $background[numbers[7]])
                        CardView(symbol: $symbols[numbers[8]], background: $background[numbers[8]])
                        Spacer()
                    }
                }
                Spacer()
                HStack {
                    Button {
                        self.numbers[3] = Int.random(in: 0...numbers.count - 1)
                        self.numbers[4] = Int.random(in: 0...numbers.count - 1)
                        self.numbers[5] = Int.random(in: 0...numbers.count - 1)
                        
                        if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5] {
                            self.background[3] = Color.green
                            self.background[4] = Color.green
                            self.background[5] = Color.green
                            credits += betAmount * 10
                        } else {
                            self.background[3] = Color.white
                            self.background[4] = Color.white
                            self.background[5] = Color.white
                            credits -= betAmount
                        }
                    } label: {
                        ButtonView(buttonView: $buttonTextView)
                    }
                    
                    Button{
                        self.numbers = self.numbers.map({ _ in
                            Int.random(in: 0...numbers.count - 1)
                        })
                        
                        if (self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]) && (self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5]) && (self.numbers[6] == self.numbers[7] && self.numbers[7] == self.numbers[8]) {
                            self.background = self.background.map({ _ in
                                Color.green
                            })
                            credits += betAmount * 100
                        } else {
                            self.background = self.background.map({ _ in
                                Color.white
                            })
                            credits -= betAmount * 10
                        }
                        
                        
                    } label: {
                        ButtonView(buttonView: $fullButtonSpin)
                    }
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
