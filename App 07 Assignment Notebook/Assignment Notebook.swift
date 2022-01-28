//
//  Assignment Notebook.swift
//  App 07 Assignment Notebook
//
//  Created by Dylan Koehler on 1/20/22.
//

import Foundation

class Notebook: ObservableObject {
    @Published var items : [ListItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ListItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}

