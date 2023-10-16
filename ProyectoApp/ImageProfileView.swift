//
//  ImageProfileView.swift
//  ProyectoApp
//
//  Created by Luis Fernanando Cabral Fong on 13/10/23.
//
import SwiftUI
import Kingfisher

struct ImageProfileView: View {
    let imageName: String  // Nombre de la imagen en tus recursos
    
    var body: some View {
            VStack {
                KFImage(URL(string: imageName))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .padding(.horizontal, 10)
        }
    }
}
