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
    
    // Core Data
    func saveData(context: NSManagedObjectContext){
        let newNote = Notes(context: context)
        newNote.note = note
        newNote.date = date
        
        do{
            try context.save()
            print("save note")
            show.toggle()
            note = ""
        }catch let error as NSError{
            // alert user
            print("No save", error.localizedDescription)
        }
    }
}
