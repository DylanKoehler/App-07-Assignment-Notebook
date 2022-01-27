//
//  AddItemView.swift
//  App 07 Assignment Notebook
//
//  Created by Student on 1/27/22.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var notebook: Notebook
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let course = ["Math", "History", "Science"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Select Course", selection: $course) {
                    ForEach(Self.course, id: \.self) { course in
                        Text(course)
                    }
                }
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(notebook: Notebook())
    }
}
