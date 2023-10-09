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
    var publicationModel = PublicationModel()
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .home:
                    HomeView()
                case .news:
                    PostView()
                case .search:
                    PostView()
                }
            }
            VStack {
                Spacer()
               // TabView(selectedTab: $selectedTab)
            }
        }
        .onAppear{
            publicationModel.fetchPublications()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Publication.self], inMemory: true)
}
