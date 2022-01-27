//
//  Assignment Notebook.swift
//  App 07 Assignment Notebook
//
//  Created by Dylan Koehler on 1/20/22.
//

import Foundation

class Notebook: ObservableObject {
    @Published var items = [ListItem(course: "Math", description: "Do Worksheet", dueDate: Date()), ListItem(course: "History", description: "Read pages", dueDate: Date()), ListItem(course: "Science", description: "Mastering Physics", dueDate: Date())]
}
