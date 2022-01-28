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
    static let course = ["Math", "History", "Science", "English", "Mobile Apps", "World Language"]
    var body: some View {
        NavigationView {
            Image("phoneBackground5")
                .resizable()
                .frame(width: 400, height: 800, alignment: .center)
                .overlay(
                    Form {
                        Picker("Select Course", selection: $course) {
                            ForEach(Self.course, id: \.self) { course in
                                Text(course)
                                    .foregroundColor(subjectColor(subject: course))
                            }
                        }
                        TextField("Description", text: $description)
                        DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    }
                    .navigationBarTitle("Add New Item", displayMode: .inline)
                    .navigationBarItems(trailing: Button("Save") {
                        if course.count > 0 && description.count > 0 {
                            let item = ListItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                            notebook.items.append(item)
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
                    .onAppear{
                        UITableView.appearance().backgroundColor = .clear
                        UITableViewCell.appearance().backgroundColor = .clear
                        
                        
                    }
                )
        }
    }
    func subjectColor (subject : String) -> Color {
        switch subject {
        case "Math":
            return .red
        case "Science":
            return .green
        case "English":
            return .blue
        case "World Language":
            return .pink
        case "History":
            return .orange
        case "Mobile Apps":
            return .purple
        default:
            return .black
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(notebook: Notebook())
    }
}
