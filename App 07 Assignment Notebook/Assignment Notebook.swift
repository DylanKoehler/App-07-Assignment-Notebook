//
//  Assignment Notebook.swift
//  App 07 Assignment Notebook
//
//  Created by Dylan Koehler on 1/20/22.
//

import Foundation

class assignmentItems: ObservableObject {
    @Published var items = [AssignmentItem(course: "Physics", description: "Mastering Physics", dueDate: Date()),
                            AssignmentItem(course: "History", description: "Read book", dueDate: Date()),
                            AssignmentItem(course: "Math", description: "Worksheet", dueDate: Date())]
 }
