//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Young on 2022/6/15.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
