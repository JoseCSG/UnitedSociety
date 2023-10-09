//
//  Pick_Role.swift
//  United Society Us
//
//  Created by Luis Fernanando Cabral Fong on 04/09/23.
//

import SwiftUI

struct Pick_Role: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Us2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .offset(y: 300)
                    .offset(x: -70)
                    .edgesIgnoringSafeArea(.all)

                Color.white.opacity(0.7)

                Rectangle()
                    .fill(Color(hex: "20E2A5"))
                    .frame(width: 45, height: 490)
                    .cornerRadius(20)
                    .rotationEffect(.degrees(42))
                    .offset(y: 300)
                    .offset(x: 50)

                Rectangle()
                    .fill(Color(hex: "DEDBDB"))
                    .frame(width: 45, height: 300)
                    .cornerRadius(20)
                    .rotationEffect(.degrees(42))
                    .offset(y: 80)
                    .offset(x: 150)

                Rectangle()
                    .fill(Color(hex: "20E2A5"))
                    .frame(width: 45, height: 400)
                    .cornerRadius(20)
                    .rotationEffect(.degrees(42))
                    .offset(y: -100)
                    .offset(x: -150)

                Rectangle()
                    .fill(Color(hex: "DEDBDB"))
                    .frame(width: 45, height: 660)
                    .cornerRadius(20)
                    .rotationEffect(.degrees(42))
                    .offset(y: -220)
                    .offset(x: -150)

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
                .navigationBarHidden(true)
            }
        }
    }
}

extension Color {
    // Extensión para crear un color desde un formato hexadecimal
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0

        scanner.scanHexInt64(&rgb)

        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}

struct Pick_Role_Previews: PreviewProvider {
    static var previews: some View {
        Pick_Role()
    }
}
