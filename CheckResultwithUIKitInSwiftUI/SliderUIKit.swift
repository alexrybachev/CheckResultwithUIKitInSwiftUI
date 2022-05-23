//
//  SliderUIKit.swift
//  CheckResultwithUIKitInSwiftUI
//
//  Created by Aleksandr Rybachev on 23.05.2022.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.tintColor = .blue
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changedValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .red
            .withAlphaComponent(CGFloat(alpha) / 100)
        
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUIKit {
    
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changedValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUI_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(value: .constant(50), alpha: 8)
    }
}
