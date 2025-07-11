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
    @Binding var leftPlayerName: String
    @Binding var rightPlayerName: String
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var bleManager = BLEManager()
    
    var body: some View {
        NavigationView {
            ScrollView {
                    // Bluetooth Connection Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bluetooth")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        VStack(spacing: 12) {
                            HStack {
                                Image(systemName: bleManager.isConnected ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(bleManager.isConnected ? .green : .gray)
                                Text("Status:")
                                    .foregroundColor(.white)
                                Spacer()
                                Text(bleManager.isConnected ? "Connected" : "Disconnected")
                                    .font(.caption)
                                    .foregroundColor(bleManager.isConnected ? .green : .red)
                            }
                            
                            // Status message
                            Text(bleManager.statusMessage)
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            
                            Button(action: {
                                handleBluetoothConnection()
                            }) {
                                HStack {
                                    if bleManager.isScanning {
                                        ProgressView()
                                            .scaleEffect(0.8)
                                            .foregroundColor(.white)
                                    } else {
                                        Image(systemName: bleManager.isConnected ? "bluetooth.slash" : "bluetooth")
                                            .foregroundColor(.white)
                                    }
                                    
                                    Text(bleManager.isConnected ? "Disconnect" : (bleManager.isScanning ? "Scanning..." : "Connect"))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(bleManager.isConnected ? Color.red.opacity(0.8) : Color.blue.opacity(0.8))
                                .cornerRadius(8)
                            }
                            .disabled(bleManager.isScanning)
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                // Player Settings Section
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Players")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text("Player 1:")
                                    .foregroundColor(.blue)
                                Spacer()
                                TextField("Player 1", text: $leftPlayerName)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.black.opacity(0.3))
                                    .cornerRadius(6)
                            }
                            
                            HStack {
                                Text("Player 2:")
                                    .foregroundColor(.red)
                                Spacer()
                                TextField("Player 2", text: $rightPlayerName)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.black.opacity(0.3))
                                    .cornerRadius(6)
                            }
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
        }
    }
    
    private func handleBluetoothConnection() {
        if bleManager.isConnected {
            // Disconnect
            bleManager.disconnect()
        } else {
            // Start scanning and connect to target device
            bleManager.connectToTargetDevice()
        }
    }
}