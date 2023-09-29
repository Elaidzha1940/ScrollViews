//  /*
//
//  Project: ScrollViews
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.09.2023
//
//  */

import SwiftUI

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Rectangle()
                        .containerRelativeFrame(.horizontal,
                                                count: verticalSizeClass == .regular ? 3 : 4,
                                                .spacing: 15)
                    //.frame(width: 90, height: 90)
                        .cornerRadius(20)
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.0)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0 : 30)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(15, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

struct Item: Identifiable {
    let id = UUID()
    let color: Color
}
struct MockData {
    static var items = [Item(color: .white),
                        Item(color: .black),
                        Item(color: .white),
                        Item(color: .black),
                        Item(color: .white),
                        Item(color: .black),
                        Item(color: .white),
                        Item(color: .black)]
}
