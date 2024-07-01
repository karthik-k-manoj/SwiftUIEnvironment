//
//  ContentView.swift
//  SwiftUIEnvironment
//
//  Created by Karthik K Manoj on 01/07/24.
//

import SwiftUI

// Custom key of type `EnvironmentKey`
// We need to provide a default value for the it's type
enum BadgeColorKey: EnvironmentKey {
    static var defaultValue: Color = .yellow
}

// Custom value which uses custom key defined above.
extension EnvironmentValues {
    var myCustomColor: Color {
        get {
            self[BadgeColorKey.self]
        }
        
        set {
            self[BadgeColorKey.self] = newValue
        }
    }
}

struct Badge: ViewModifier {
    @Environment(\.myCustomColor) private var badgeColor
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background {
                Capsule(style: .continuous)
                    .fill(badgeColor)
            }
    }
}

extension View {
    func badgeColor(_ color: Color) -> some View {
        environment(\.myCustomColor, color)
    }
    
    func applyBadge() -> some View {
        modifier(Badge())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text(3000, format: .number)
                .applyBadge()
            Text(4000, format: .number)
                .applyBadge()
        }
        .badgeColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

