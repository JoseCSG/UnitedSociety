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
            modelContext.insert(User(user_id: "6524dfe1d805c888097581fd", name: "Jose", tags: ["Cancer", "Primeros"], number: "38248242", last_name: "Sánchez"))
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Publication.self, User.self], inMemory: true)
}

