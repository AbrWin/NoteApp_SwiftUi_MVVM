//
//  ViewModel.swift
//  Notes
//
//  Created by Abraham Sánchez Juárez on 05/09/22.
//

import Foundation
import CoreData
import SwiftUI
import Combine

class ViewModel: ObservableObject{
    @Published var note = ""
    @Published var date = Date()
    @Published var show = false
    @Published var updateItem: Notes!
    
    // Core Data
    func saveData(context: NSManagedObjectContext){
        let newNote = Notes(context: context)
        newNote.note = note
        newNote.date = date
        
        do{
            try context.save()
            print("save note")
            initNote()
        }catch let error as NSError{
            // alert user
            print("No save", error.localizedDescription)
        }
    }
    
    
    func deleteNote(item: Notes, context: NSManagedObjectContext){
        context.delete(item)
        do{
            try context.save()
        }catch let error as NSError{
            // alert user
            print("No save", error.localizedDescription)
        }
    }
    
    func editNote(item: Notes){
        updateItem = item
        note = item.note ?? ""
        date = item.date ?? Date()
        show.toggle()
    }
    
    func updateNote(context: NSManagedObjectContext){
        updateItem.date = date
        updateItem.note = note
        do{
            print("Note -> The note was edit")
            try context.save()
            updateItem = nil
            initNote()
        }catch let error as NSError{
            // alert user
            print("No edit", error.localizedDescription)
        }
    }
    
    func initNote(){
        note = ""
        date = Date()
        show.toggle()
    }
}
