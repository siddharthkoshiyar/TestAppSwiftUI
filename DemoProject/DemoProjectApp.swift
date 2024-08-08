//
//  DemoProjectApp.swift
//  DemoProject
//
//  Created by SIDDHARTH KOSHIYAR on 08/08/24.
//

import SwiftUI

@main
struct DemoProjectApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(vm: HomeVM())
        }
    }
}
