//
//  SettingsView.swift
//  AceTrack Watch App
//
//  Created by Chachi on 2025-07-10.
//

import SwiftUI

struct SettingsView: View {
    @Binding var leftScore: Int
    @Binding var rightScore: Int
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Player Names Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Players")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text("Player 1:")
                                    .foregroundColor(.blue)
                                Spacer()
                                Text("P1")
                                    .foregroundColor(.white)
                            }
                            
                            HStack {
                                Text("Player 2:")
                                    .foregroundColor(.red)
                                Spacer()
                                Text("P2")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    // About Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("AceTrack")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Version 1.0")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("Simple scoreboard for Apple Watch")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}