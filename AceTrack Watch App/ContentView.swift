//
//  ContentView.swift
//  AceTrack Watch App
//
//  Created by Chachi on 2025-07-10.
//

import SwiftUI

struct ContentView: View {
    @State private var leftScore = 0
    @State private var rightScore = 0
    @State private var showingSettings = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Main scoreboard area
            HStack(spacing: 0) {
                // Left side (Player 1)
                Button(action: {
                    leftScore += 1
                }) {
                    VStack(spacing: 8) {
                        Text("P1")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("\(leftScore)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                }
                .buttonStyle(PlainButtonStyle())
                
                // Right side (Player 2)
                Button(action: {
                    rightScore += 1
                }) {
                    VStack(spacing: 8) {
                        Text("P2")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("\(rightScore)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .frame(maxHeight: .infinity)
            
            // Control buttons area
            HStack(spacing: 4) {
                // Decrease left score
                Button(action: {
                    if leftScore > 0 {
                        leftScore -= 1
                    }
                }) {
                    Text("-")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.red.opacity(0.8))
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
                
                // Reset button
                Button(action: {
                    leftScore = 0
                    rightScore = 0
                }) {
                    Text("RESET")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .buttonStyle(PlainButtonStyle())
                
                // Decrease right score
                Button(action: {
                    if rightScore > 0 {
                        rightScore -= 1
                    }
                }) {
                    Text("-")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.blue.opacity(0.8))
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .edgesIgnoringSafeArea(.all)
        .simultaneousGesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.height < -50 && value.startLocation.y > 120 {
                        showingSettings = true
                    }
                }
        )
        .sheet(isPresented: $showingSettings) {
            SettingsView(leftScore: $leftScore, rightScore: $rightScore)
        }
    }
}

#Preview {
    ContentView()
}
