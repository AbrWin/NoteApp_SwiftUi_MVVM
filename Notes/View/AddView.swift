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
            let isNewNote = model.updateItem == nil
            let titleModal = isNewNote ? "Add Notes" : "Edit your note"
    
            Text(isNewNote ? "Add Notes" : "Edit your note")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.note)
            Divider()
            DatePicker("Select date:", selection: $model.date)
            Spacer()
            Button(action: {
                if model.updateItem != nil{
                    model.updateNote(context: context)
                }else{
                    model.saveData(context: context)
                }                
            }){
                Label(
                    title: { Text("Save").foregroundColor(.white).bold()},
                    icon: { Image(systemName: "plus").foregroundColor(.white)})
            }.padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(model.note == "" ? Color.gray : Color.blue)
            .cornerRadius(8)
            .disabled(model.note == "" ? true : false)
        }.padding()
        
    }
}

