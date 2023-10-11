//
//  ContentView.swift
//  ProyectoApp
//
//  Created by Alumno on 18/09/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showPostView = false
    @State var selectedTab: Tab = .home
    @State var publicationModel = PublicationModel()
    @Environment(\.modelContext) private var modelContext

    var body: some View{
        HomeView(feed: true, publicationModel: $publicationModel)
        .onAppear{
            publicationModel.fetchPublications()
        }
    }
}

#Preview {
    ContentView()
           .modelContainer(for: [Publication.self], inMemory: true)
}
