//
//  ProfileView.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI
import SwiftData
import MapKit


struct ProfileView: View {
    var publicationModel = PublicationModel()
    @Query private var user: [User]
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack {
                    HStack {
                        ImageProfileView(imageName: user.last!.img)
                            .frame(width: 90, height: 90)
                            .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading) {
                            Text(user.last!.name)
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            
                            Text(user.last!.location)
                                .font(.subheadline)
                                .foregroundColor(.black)
                            
                            Text(String(user.last!.age))
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        
                    }
                    .padding(.top, 90)
                    
                    HStack {
                        VStack {
                            Text("Tags seguidos")
                                .padding(.horizontal, 10)
                                .font(.headline)
                                .foregroundColor(Color.black)
                                .padding(.bottom, 5)
                        }
                        .fixedSize(horizontal: true, vertical: false)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            ZStack {
                                Color.clear
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                                
                                HStack {
                                    ForEach(user.last!.tags, id: \.self) { tag in
                                        Text(tag)
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .background(Color.lightgray)
                                            .overlay(RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.clear, lineWidth: 3))
                                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                                            .padding(.horizontal, 5)
                                    }
                                }
                            }
                            .frame(height: 30)
                            .padding(.horizontal, 5)
                        }
                    }
                    
                    
                    .padding(.vertical, 5)
                    HStack {
                        if (!user.isEmpty) {
                            NavigationLink(destination: EditProfileView()) {
                                Text("Editar Perfil")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 40)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 5)
                                    .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                    .cornerRadius(10)
                            }
                            
                            NavigationLink(destination: FollowView()) {
                                Text("Seguidos")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 40)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 5)
                                    .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    Divider()
                        .frame(height: 1.5)
                        .background(Color.lightgray)
                        .padding()
                    
                    if(publicationModel.publications.isEmpty){
                        VStack(alignment: .leading){
                            Text("No ha publicado nada José Sánchez")
                        }
                        .foregroundColor(.white)
                    }
                    else {
                        ForEach(publicationModel.publications){ pub in
                            PublicationView(upvote: true, downvote: false, publication: pub)
                        }
                        .tint(.black)
                    }
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .onAppear{
                if(!user.isEmpty){
                    publicationModel.fetchPublicationsUser(id_user: user.last!.user_id)
                }
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
