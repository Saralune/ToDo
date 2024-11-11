//
//  Task.swift
//  ToDo
//
//  Created by Sara Lefort on 10/11/2024.
//

import Foundation

struct Task : Identifiable {
  let id = UUID()
  let title: String
  let priority: Int
}
