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
        NavigationStack{
            NavigationView{
                LogInView()
            }
        }
        .onAppear{
            let user = User(user_id: "6524dfe1d805c888097581fd", name: "Jose", tags: ["Cancer", "Nuevo Leon"], number: "9612462865", last_name: "Sanchez", location: "Monterrey", age: 20, img: "https://firebasestorage.googleapis.com:443/v0/b/united-society-fad81.appspot.com/o/publications%2F6DD34CBC-46AE-40E7-AE47-B39F26D36074?alt=media&token=72585d82-7885-4b05-ad8f-7b884fe7d901")
            modelContext.insert(user)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Publication.self, User.self], inMemory: true)
}
