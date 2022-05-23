//
//  ButtonView.swift
//  CheckResultwithUIKitInSwiftUI
//
//  Created by Aleksandr Rybachev on 23.05.2022.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("\(title)")
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "hello", action: {})
    }
}
