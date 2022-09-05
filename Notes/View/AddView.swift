//
//  AddView.swift
//  Notes
//
//  Created by Abraham Sánchez Juárez on 05/09/22.
//

import SwiftUI


struct AddView: View {
    
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            Text("Add Note")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.note)
            Divider()
            DatePicker("Select date:", selection: $model.date)
            Spacer()
            Button(action: {
                model.saveData(context: context)
            }){
                Label(
                    title: { Text("Save").foregroundColor(.white).bold()},
                    icon: { Image(systemName: "plus").foregroundColor(.white)})
            }.padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(Color.blue)
            .cornerRadius(8)
        }.padding()
        
    }
}

