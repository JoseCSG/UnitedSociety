//
//  Pick_Role.swift
//  United Society Us
//
//  Created by Luis Fernanando Cabral Fong on 04/09/23.
//

import SwiftUI

struct Pick_Role: View {
    var body: some View {
            ZStack {
                // Integra BackgroundView al fondo
                BackgroundView()
                
                VStack {
                    Text("Que buscas")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 100)
                        .padding(.bottom, 100)
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: TagsAsociation()) {
                            Text("Busco Publicar mi Asociación")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .frame(width: 280, height: 50)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 5)
                                )
                        }

                        NavigationLink(destination: TagUser()) {
                            Text("Busco los Servicios de una Asociación")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .frame(width: 280, height: 50)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 5)
                                )
                        }
                    }
                    .navigationBarTitle("", displayMode: .inline) // Establece el título en blanco
                    .padding(.horizontal)

                    Spacer()

                    HStack {
                        Spacer()
                    }
                    .alignmentGuide(.bottom) { d in d[.bottom] }
                }
            }
    }
}

struct Pick_Role_Previews: PreviewProvider {
    static var previews: some View {
        Pick_Role()
    }
}
