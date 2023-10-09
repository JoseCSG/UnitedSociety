//
//  FeedView.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI
import SwiftData

struct FeedView: View {
    @Environment(\.modelContext) private var modelContext
    @State var pubs = [
        Publication(title: "Primer Título", img: "Space", likes: 2, descption: "Una descripción generica")]
    @Query private var Publications: [Publication]
    var publicationModel = PublicationModel()
    var body: some View {
        ZStack{
            Color.lightgray
            VStack{
                NavigationStack{
                    ScrollView(.vertical){
                        ForEach(publicationModel.publications) { pub in
                            NavigationLink{
                                PublicationDetailView(publication: pub)
                            } label: {
                                PublicationView(publication: pub)
                                    .padding(.top, 10)
                            }
                            .tint(.black)
                        }
                    }
                }
            }
        }
        .onAppear{
            publicationModel.fetchPublications()
        }
    }
}

#Preview {
    FeedView()
        .modelContainer(for: [Publication.self], inMemory: true)
}
