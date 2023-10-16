//
//  FeedView.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI
import SwiftData

struct FeedView: View {
    //  @Environment(\.modelContext) private var modelContext
    @Binding var publicationModel: PublicationModel
    var body: some View {
        ZStack{
            Color.lightgray
            VStack{
                    ScrollView(.vertical){
                        if(publicationModel.publications.isEmpty){
                            Text("No sigues a ninguna organización")
                        }
                        else{
                            LazyVStack(spacing: 10){
                                ForEach(publicationModel.publications) { pub in
                                    PublicationView(publication: pub)
                                    .tint(.black)
                                }
                            }

                        }
                }
            }
        }
    }
}

