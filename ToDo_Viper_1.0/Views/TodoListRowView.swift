//
//  TodoListRowView.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import SwiftUI

struct TodoListRowView: View {
    @State var todo: Todo
    @State private var isShowDetailView: Bool = false
    @State private var todoCompleted: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {todoCompleted.toggle()}, label: {
                    if todoCompleted {
                        ZStack {
                            Image("circleYellow")
                            Image("tick")
                        }
                    } else {
                        Image("circleGray")
                            .clipped()
                    }
                })
                
                Text(todo.todo)
                    .opacity(0.5)
                    .font(Font.mainFont)
                    .strikethrough(todoCompleted)
                    .foregroundStyle(Color.white)
                    .contextMenu {
                        Button("Редактировать", image: ImageResource(name: "edit", bundle: .main)) {
                            isShowDetailView.toggle()
                        }
                        
                        ShareLink(item: todo.todo) {
                            Label("Поделиться", image: "export")
                        }
                        
                        Button("Удалить", image: ImageResource(name: "trash", bundle: .main), role: .destructive) {
                            //                            if let index = tasksData.tasks.firstIndex(of: task!) {
                            //                                tasksData.deleteTask(at: index)
                            //                            }
                        }
                    }
                Spacer()
            }
            
            HStack {
                VStack{}.frame(width: 25)
                VStack(alignment: .leading) {
                    
                    Text(todo.notes)
                        .opacity(todoCompleted ? 0.5 : 1)
                        .font(Font.secondaryFont)
                    
                    Text(String(todo.time.formatted(date: .numeric, time: .omitted)))
                        .opacity(todoCompleted ? 0.5 : 1)
                        .font(Font.secondaryFont)
                }
            }
            .foregroundStyle(Color.white)
            
            Spacer()
        }
        .frame(height: 106)
        .background(Color.black)
        .sheet(isPresented: $isShowDetailView) {
            //DetailScreenView(taskIndex: taskIndex, showDoneButton: true)
        }
    }
}


#Preview {
    TodoListRowView(todo: Todo.previewTodo)
}
