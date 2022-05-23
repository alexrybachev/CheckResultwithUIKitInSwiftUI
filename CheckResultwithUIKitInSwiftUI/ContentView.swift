//
//  ContentView.swift
//  CheckResultwithUIKitInSwiftUI
//
//  Created by Aleksandr Rybachev on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 1.0
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Text("Подвиньте слайдер, как можно ближе к:")
                Text("\(targetValue)")
                    .fontWeight(.bold)
                    .frame(width: 40, height: 32, alignment: .trailing)
            }
            
            HStack {
                Text("0")
                SliderUIKit(value: $currentValue, alpha: computeScore())
                Text("100")
            }
            
            Button("Проверь меня!", action: { isPresented.toggle() })
                .alert("Ваш счет",
                       isPresented: $isPresented,
                       actions: {}) {
                    Text("\(computeScore())")
                }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = 0
            }
        }
        .padding()
    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
