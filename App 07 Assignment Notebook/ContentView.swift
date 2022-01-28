//  ContentView.swift
//  App 07 Assignment Notebook
//
//  Created by Dylan Koehler on 1/20/22.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var notebook = Notebook()
    @State private var showingAddItemView = false
    //variable that checks if the edit more is active
    @State var mode: EditMode = .inactive
    var body: some View {
        NavigationView {
            Image("phoneBackground5")
                .resizable()
                .frame(width: 400, height: 800, alignment: .center)
                .overlay(
            List {
                ForEach (notebook.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .foregroundColor(subjectColor(subject: item.course))
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        //hides date if edit mode is on
                        Text(mode.isEditing ? "" : "\(item.dueDate, style: .date)")
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
            // Assignes mode variable to the current state edit mode
            .environment(\.editMode, $mode)
            )
        }
    }
    //color codes subjects
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
    //Makes background color of the list clear to be able to see the image
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear

    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListItem : Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
