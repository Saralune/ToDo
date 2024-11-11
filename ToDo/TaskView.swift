//
//  TaskView.swift
//  ToDo
//
//  Created by Sara Lefort on 10/11/2024.
//

import SwiftUI

struct TaskView: View {
  let task: Task
  @Binding var taskCollection: [Task]
  
  var flagColor: Color {
    switch task.priority{
    case 1: return .red
    case 2: return .orange
    case 3: return .blue
    default: return .gray
    }
  }
  
  var body: some View {
    HStack {
      Text(task.title)
        .bold()
      Spacer()
      Image(systemName: "flag.fill")
        .foregroundStyle(flagColor)
    }
  }

}

#Preview {
  TaskView(task: Task(title: "Preview Task", priority: 3), taskCollection: .constant([]))
    .padding()
}
