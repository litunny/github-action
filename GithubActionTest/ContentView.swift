//
//  ContentView.swift
//  GithubActionTest
//
//  Created by Itunu on 26/11/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        Text("Select an item")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
