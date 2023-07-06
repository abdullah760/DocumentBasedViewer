//
//  Document_based_appApp.swift
//  Document-based-app
//
//  Created by Abdullah on 04/07/2023.
//

import SwiftUI

@main
struct Document_based_appApp: App {
    var body: some Scene {
        DocumentGroup (newDocument: imageFile()) { file in
            ContentView( documentImage: file.$document)
    }
  }
}
