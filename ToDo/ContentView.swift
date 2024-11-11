//
//  ContentView.swift
//  ToDo
//
//  Created by Sara Lefort on 10/11/2024.
//

import SwiftUI

struct ContentView: View {
  @State private var isShowingNewScreen = false
  
  @State var myTasks: [Task] = [
    Task(title: "Test task 1", priority: 2),
    Task(title: "Test task 2", priority: 3),
    Task(title: "Test task 3", priority: 1),
    Task(title: "Test task 4", priority: 4)
  ]
  
  var body: some View {
    VStack{
      Text("Ma Liste de tâches")
        .font(.title)
        .bold()
        .padding()
        .foregroundColor(.purple)
      
      if myTasks.isEmpty {
        /// `myTask` est vide, on affiche donc un message.
        Text("Aucune tâche en vue !")
      } else {
        List {
          ForEach(myTasks){ task in
              TaskView(task: task, taskCollection: $myTasks)
          }
          .onDelete(perform: removeRows)
        }
      }
    }
    .sheet(isPresented: $isShowingNewScreen) {
      NewTaskView(taskCollection: $myTasks)
    }
    .overlay(alignment: .bottomTrailing) {
      Button {
        isShowingNewScreen = true
      } label: {
        Image(systemName: "plus")
          .font(.system(size: 28, weight: .bold))
          .foregroundStyle(.white)
          .padding()
          .background(Circle())
          .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 10)
      }
      .padding()
    }
  }
  
  /// Help from Paul Hudscon : https://www.hackingwithswift.com/books/ios-swiftui/deleting-items-using-ondelete
  func removeRows(at offsets: IndexSet) {
    myTasks.remove(atOffsets: offsets)
  }
}

#Preview {
  ContentView()
}
