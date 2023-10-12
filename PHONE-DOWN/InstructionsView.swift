//
//  InstructionsView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-09.
//

import SwiftUI

struct InstructionsView: View {
    
    var body: some View {
            VStack {
                Text("""
                    Place phone face-down on a clean 
                    flat surface and get started
                    on work immediately.
                    """)
                .font(.headline)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("MessageColor"))
                .padding()
                .offset(y:-20)
            }
    }
}

#Preview {
    InstructionsView()
}
