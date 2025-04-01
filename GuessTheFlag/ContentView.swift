//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gabriel Santos on 27/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showFinalAlert = false
    @State private var scoreTitle = ""
    @State private var scoreSubtitle = ""
    
    @State private var score = 0
    @State private var questionsSaw = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ],
                center: .top,
                startRadius: 200,
                endRadius: 400
            ).ignoresSafeArea()
            
            VStack {
                Text("Guess the flag")
                    .bigTitleStyle()
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack() {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .font(.subheadline.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImageView(imageName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()
                
                VStack {
                    Text("Score \(score)")
                        .bigTitleStyle()
                }
                
                Spacer()
            }.padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if questionsSaw == 8 {
                Button("Restart the game") {
                    reset()
                }
            } else {
                Button("Continue") {
                    askQuestion()
                }
            }
        } message: {
            if questionsSaw == 8 {
                Text("Your score is \(score) of 8")
            } else {
                Text(scoreSubtitle)
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        
        questionsSaw += 1
        
        if questionsSaw == 8 {
            scoreTitle = "The end"
        } else {
            if number == correctAnswer {
                scoreTitle = "Correct. \(questionsSaw) of 8"
                score += 1
            } else {
                scoreTitle = "Wrong. \(questionsSaw) of 8"
                scoreSubtitle = "That's the flag of \(countries[number])"
            }
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        countries.shuffle()
        score = 0
        questionsSaw = 0
    }
}

#Preview {
    ContentView()
}


