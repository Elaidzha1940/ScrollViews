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
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Rectangle()
                        .frame(width: 90, height: 90)
                        .cornerRadius(20)
                        .foregroundStyle(item.color.gradient)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
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
