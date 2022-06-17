//
//  Buttons.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import Foundation
import SwiftUI



//rounded buttons start

struct RoundedButtonStyle : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(Color.primary)
            .padding(.vertical, 10)
            .padding(.horizontal,20)
            .background(
                Capsule()
                    .stroke(Color.theme.accent, lineWidth: 1)
            )
    }
}

extension View{
    func roundedButtonStyle() -> some View{
        self.modifier(RoundedButtonStyle())
    }
}
//rounded buttons start
