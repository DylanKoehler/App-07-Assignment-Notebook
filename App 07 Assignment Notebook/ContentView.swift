//  ContentView.swift
//  App 07 Assignment Notebook
//
//  Created by Dylan Koehler on 1/20/22.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var notebook = Notebook()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List {
                ForEach (notebook.items) { item in
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
                    notebook.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    notebook.items.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddItemView(notebook: notebook)
            })
            .navigationBarTitle("To Do List", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { showingAddItemView = true}) { Image(systemName: "plus")
            })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListItem : Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
