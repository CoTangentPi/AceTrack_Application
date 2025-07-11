//
//  BLEManager.swift
//  AceTrack Watch App
//
//  Created by Chachi on 2025-07-10.
//

import Foundation
import CoreBluetooth
import SwiftUI

class BLEManager: NSObject, ObservableObject {
    @Published var isConnected = false
    @Published var isScanning = false
    @Published var discoveredDevices: [CBPeripheral] = []
    @Published var statusMessage = "Ready to scan"
    
    private var centralManager: CBCentralManager!
    private var connectedPeripheral: CBPeripheral?
    
    // Target device name to scan for
    private let targetDeviceName = "AceTrack"
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScanning() {
        guard centralManager.state == .poweredOn else {
            statusMessage = "Bluetooth not available"
            return
        }
        
        discoveredDevices.removeAll()
        isScanning = true
        statusMessage = "Scanning for devices..."
        
        // Scan for all devices (you can specify service UUIDs if needed)
        centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
        
        // Stop scanning after 10 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.stopScanning()
        }
    }
    
    func stopScanning() {
        centralManager.stopScan()
        isScanning = false
        
        if discoveredDevices.isEmpty {
            statusMessage = "No devices found"
        } else {
            statusMessage = "Found \(discoveredDevices.count) device(s)"
        }
    }
    
    func connect(to peripheral: CBPeripheral) {
        connectedPeripheral = peripheral
        peripheral.delegate = self
        centralManager.connect(peripheral, options: nil)
        statusMessage = "Connecting to \(peripheral.name ?? "Unknown")..."
    }
    
    func disconnect() {
        guard let peripheral = connectedPeripheral else { return }
        centralManager.cancelPeripheralConnection(peripheral)
    }
    
    func connectToTargetDevice() {
        // Look for device with target name
        if let targetDevice = discoveredDevices.first(where: { $0.name?.contains(targetDeviceName) == true }) {
            connect(to: targetDevice)
        } else {
            // Start scanning if no target device found
            startScanning()
        }
    }
}

// MARK: - CBCentralManagerDelegate
extension BLEManager: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            statusMessage = "Bluetooth ready"
        case .poweredOff:
            statusMessage = "Bluetooth is off"
        case .unauthorized:
            statusMessage = "Bluetooth unauthorized"
        case .unsupported:
            statusMessage = "Bluetooth unsupported"
        default:
            statusMessage = "Bluetooth unavailable"
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        // Only add devices with names
        guard let name = peripheral.name, !name.isEmpty else { return }
        
        // Avoid duplicates
        if !discoveredDevices.contains(where: { $0.identifier == peripheral.identifier }) {
            discoveredDevices.append(peripheral)
            
            // Auto-connect if this is our target device
            if name.contains(targetDeviceName) {
                stopScanning()
                connect(to: peripheral)
            }
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        isConnected = true
        statusMessage = "Connected to \(peripheral.name ?? "Unknown")"
        peripheral.discoverServices(nil)
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        statusMessage = "Failed to connect: \(error?.localizedDescription ?? "Unknown error")"
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        isConnected = false
        connectedPeripheral = nil
        
        if let error = error {
            statusMessage = "Disconnected: \(error.localizedDescription)"
        } else {
            statusMessage = "Disconnected"
        }
    }
}

// MARK: - CBPeripheralDelegate
extension BLEManager: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        // Handle characteristic discovery here if needed
    }
}
