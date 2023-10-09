//
//  ProfileView.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI
import MapKit


struct ProfileView: View {
    var body: some View {
        Color(red: 55/255, green: 94/255, blue: 152/255)
            .ignoresSafeArea()
            .overlay(
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
                    
                    VStack(alignment: .leading){
                        Text("No publico nada Emmanuel")
                    }
                    .foregroundColor(.white)

                    Spacer()
                }
            )
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
