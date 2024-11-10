//
//  NewTaskView.swift
//  ToDo
//
//  Created by Sara Lefort on 10/11/2024.
//

import SwiftUI

struct NewTaskView: View {
  @State private var taskName: String = ""
  @State private var priority: Int = 4
  @Binding var taskCollection: [Task]
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      TextField("Nouvelle tâche...", text: $taskName)
        .textFieldStyle(.roundedBorder)
      
      Picker("Priorité", selection: $priority) {
        Text("Aucune")
          .tag(4)
        Text("Basse")
          .tag(3)
        Text("Moyenne")
          .tag(2)
        Text("Haute")
          .tag(1)
      }
      .pickerStyle(.segmented)
      
      Button {
        saveTask()
      } label: {
        Text("Créer")
          .padding()
          .foregroundStyle(.white)
          .bold()
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .clipShape(RoundedRectangle(cornerRadius: 8))
      }
      .padding()
      
    }
    .padding()
  }
  
  private func saveTask() {
    let newTask = Task(title: taskName, priority: priority)
    taskCollection.append(newTask)
    dismiss() // Quitter l'écran automatiquement
  }
}

#Preview {
  NewTaskView(taskCollection: .constant([]))
}
