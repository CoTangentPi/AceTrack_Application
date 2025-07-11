# AceTrack - Apple Watch Tennis Score Tracker

A sleek and intuitive Apple Watch app for tracking scores in tennis and other competitive sports. Keep score with simple taps and manage your game settings with ease.

![Apple Watch](https://img.shields.io/badge/Apple%20Watch-Compatible-blue)
![watchOS](https://img.shields.io/badge/watchOS-11.5+-green)
![Swift](https://img.shields.io/badge/Swift-5.0-orange)
![Xcode](https://img.shields.io/badge/Xcode-16.0+-blue)
![Version](https://img.shields.io/badge/Version-1.0-brightgreen)

## Demo Video

See AceTrack in action! Watch the demo video to see how easy it is to track scores on your Apple Watch:


**Note**: Demo will showcase version 1.0 features and functionality

## Features

### **Main Scoreboard**
- **Tap to Score**: Simply tap the player area to increase their score
- **Score Reduction**: Dedicated "-1" buttons to reduce scores when mistakes are made
- **Quick Reset**: Reset scores to 0-0 when starting a new set
- **Visual Player Areas**: Color-coded scoring areas (Blue for Player 1, Red for Player 2)

### **Settings & Customization**
- **Player Names**: Customize player names instead of default "P1" and "P2"
- **Swipe Navigation**: Access settings by swiping up from the bottom of the main screen
- **Bluetooth Connectivity**: Connect to AceTrack smart scoreboard accessories *(coming soon)*

### **Smart Design**
- **Watch-Optimized**: Designed specifically for Apple Watch's small screen
- **Large Touch Targets**: Easy to tap even during intense gameplay
- **Clear Typography**: Bold, easy-to-read score display

## How to Use

### **Scoring**
1. **Increase Score**: Tap anywhere on a player's colored area
2. **Decrease Score**: Use the small "-1" circular buttons at the bottom
3. **Reset Game**: Tap the "RESET" button to start fresh

### **Settings**
1. **Access Settings**: Swipe up from the bottom of the main screen
2. **Change Player Names**: Tap the text fields to edit player names
3. **Bluetooth Setup**: Use the Connect button to pair with AceTrack accessories *(in development)*

## Technical Requirements

- **Device**: Apple Watch Series 4 or later
- **OS**: watchOS 11.5 or later
- **Xcode**: 16.0 or later for development
- **Language**: Swift 5.0+

## Project Structure

```
AceTrack Watch App/
├── AceTrackApp.swift          # Main app entry point
├── ContentView.swift          # Main scoreboard interface
├── SettingsView.swift         # Settings and configuration
├── BLEManager.swift           # Bluetooth connectivity manager
└── Assets.xcassets/           # App icons and resources
```

## Features in Development

### **Smart Scoreboard Integration**
- **BLE Connectivity**: Connect to external AceTrack smart scoreboards
- **Real-time Sync**: Scores automatically sync between watch and scoreboard

### **Advanced Scoring**
- **Set Tracking**: Track multiple sets in a match
- **Game History**: Review previous games and statistics
- **Tournament Mode**: Support for bracket-style tournaments

## Use Cases

- **Tennis**: Perfect for recreational and competitive tennis matches
- **Table Tennis**: Quick scoring for ping pong games
- **Badminton**: Track shuttlecock rallies and sets
- **Any Sport**: Adaptable for any competitive sport with numeric scoring

## Getting Started

### **Installation**
1. Clone this repository
2. Open `AceTrack.xcodeproj` in Xcode
3. Select your Apple Watch target device
4. Build and run the project

### **Development Setup**
```bash
git clone https://github.com/CoTangentPi/AceTrack_Application.git
cd AceTrack_Application
open AceTrack.xcodeproj
```

## Version Information

**Current Version**: 1.0  
**Release Date**: July 2025  
**Compatibility**: watchOS 11.5+  

### **Version History**
- **v1.0**
  - Initial release
  - Basic score tracking functionality
  - Player name customization
  - Settings interface with swipe navigation
  - Bluetooth connectivity framework (in development)