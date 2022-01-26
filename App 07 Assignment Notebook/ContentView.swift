//  ContentView.swift
//  To Do List
//
//  Created by Dylan Koehler on 1/10/22.
//
import SwiftUI

struct ContentView: View {
    @State private var notebookItems = [ListItem(course: "Math", description: "Do Worksheet", dueDate: Date()), ListItem(course: "History", description: "Read pages", dueDate: Date()), ListItem(course: "Science", description: "Mastering Physics", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach (notebookItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    notebookItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    notebookItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("To Do List", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
