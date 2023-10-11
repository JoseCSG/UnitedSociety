//
//  ProfileView.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI
import MapKit


struct ProfileView: View {
    var publicationModel = PublicationModel()
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Color(red: 55/255, green: 94/255, blue: 152/255)
                VStack{
                    VStack {
                        MapView()
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 200)
                        
                        
                        CircleImage(image: Image(systemName: "a"))
                            .offset(y: -130)
                            .padding(.bottom, -130)
                        
                        
                        VStack(alignment: .center) {
                            Text("Emmanuel Macron")
                                .font(.title)
                            
                            
                            VStack {
                                Text("Paris, France")
                                Text("49 años")
                            }
                            .font(.subheadline)
                            .foregroundColor(.white)
                            
                            
                            Divider()
                                .frame(height: 1.5)
                                .overlay(Color.white)
                                .padding()
                            
                        }
                        .foregroundColor(.white)
                        .padding()
                        
                        if(publicationModel.publications.isEmpty){
                            VStack(alignment: .leading){
                                Text("No publico nada Emmanuel")
                            }
                            .foregroundColor(.white)
                        }
                        else {
                            ForEach(publicationModel.publications){ pub in
                                    PublicationView(publication: pub)
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onAppear{
            publicationModel.fetchPublicationsUser(id: "651f3c24f7fc02789f00d1f9")
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
