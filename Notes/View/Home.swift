//
//  Home.swift
//  Notes
//
//  Created by Abraham Sánchez Juárez on 05/09/22.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    @FetchRequest(entity: Notes.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],
                  animation: .spring())
    var results : FetchedResults<Notes>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(results){item in 
                    VStack(alignment: .leading){
                        Text(item.note ?? "Without note")
                            .font(.title)
                            .bold()
                        Text(item.date ?? Date(), style: .date)
                    }
                }
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {
                    model.show.toggle()
                }){
                    Image(systemName: "plus").font(.title).foregroundColor(.blue)
                }
                ).sheet(isPresented: $model.show, content: {
                    AddView(model: model)
                })
        }
    }
}
