//
//  ContentView.swift
//  guesstheflag
//
//  Created by Reed on 4/8/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Tap the flag of").foregroundStyle(.white)
                Text(countries[correctAnswer]).foregroundStyle(.white)
            }
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestions)
        } message: {
            Text("Your score is ???")
        }
        ForEach(0..<3) { number in
            Button {
                flagTapped(number)
            } label: {
                Image(countries[number])
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            print("Correct")
            scoreTitle = "Correct"
        } else {
            print("Wrong")
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    
    func askQuestions() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
