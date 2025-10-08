//
//  TestData.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation

//Mock data for tests

let testTodoData: Data = """
    {
      "id": 1,
      "todo": "Do something nice for someone you care about",
      "completed": false,
      "userId": 152
    }
""".data(using: .utf8)!

let testTodosData: Data = """
{
  "todos": [
    {
      "id": 1,
      "todo": "Do something nice for someone you care about",
      "completed": false,
      "userId": 152
    },
    {
      "id": 2,
      "todo": "Memorize a poem",
      "completed": true,
      "userId": 13
    },
    {
      "id": 3,
      "todo": "Watch a classic movie",
      "completed": true,
      "userId": 68
    },
    {
      "id": 4,
      "todo": "Watch a documentary",
      "completed": false,
      "userId": 84
    },
    {
      "id": 5,
      "todo": "Invest in cryptocurrency",
      "completed": false,
      "userId": 163
    },
    {
      "id": 6,
      "todo": "Contribute code or a monetary donation to an open-source software project",
      "completed": false,
      "userId": 69
    }
  ],
  "total": 254,
  "skip": 0,
  "limit": 30
}
""".data(using: .utf8)!
