//
//  FollowView.swift
//  ProyectoApp
//
//  Created by Luis Fernanando Cabral Fong on 13/10/23.
//

import SwiftUI
import SwiftData

enum UserRoll {
    case usuario
    case asociacion
}

struct FollowView: View {
    // Variables para los datos del perfil
    @State private var orgname = "Consejo Civico"
    // Variable para el rol (usuario o asociación)
    @Query private var user: [User]

    var userRoll: UserRoll = .usuario
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                        VStack(alignment: .leading){
                            Text("Seguidos")
                                .padding(.horizontal, 10)
                                .frame(maxWidth: .infinity)
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            
                            Divider()
                                .frame(height: 1.5)
                                .background(Color.lightgray)
                                .padding()
                            ScrollView{
                                HStack {
                                    NavigationLink(destination: Register()){
                                        ImageProfileView(imageName: user[0].img)
                                            .frame(width: 90, height: 90)
                                            .padding(.horizontal, 20)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(orgname)
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(.black)
                                            .padding(.vertical, 5)
                                        Button(action: {
                                            // Aquí puedes agregar la lógica para dejar de seguir
                                        }) {
                                            Text("Dejar de seguir")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .frame(width: 180, height: 40)
                                                .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                                .cornerRadius(10)
                                        }
                                        

                                    }
                                    Divider()
                                        .frame(height: 1.5)
                                        .background(Color.lightgray)
                                        .padding()
                                }
                            }
    
                        
                        
                        Spacer()
                    }
                }
            }
            
        }
    }
        
        struct FollowView_Previews: PreviewProvider {
            static var previews: some View {
                FollowView()
            }
        }
}
