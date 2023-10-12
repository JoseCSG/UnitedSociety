//
//  TagsUser.swift
//  United Society Us
//
//  Created by Luis Fernanando Cabral Fong on 05/09/23.
//

import SwiftUI

struct TagUser: View {
    // Ejemplos de etiquetas
    let tagExamples = ["de tin", "marin", "de", "dopin", "gue", "pegale", "ese"]
    
    // Variable de estado para almacenar las etiquetas seleccionadas
    @State private var selectedTags: Set<String> = []
    
    var body: some View {
        ZStack {
            // Coloca la imagen de fondo
            Image("Us2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .offset(y: 300) // Ajusta la posición vertical según tus necesidades
                .offset(x: -70)
                .edgesIgnoringSafeArea(.all)
            
            Color.white.opacity(0.7) // Capa de color blanco semitransparente para mejorar la legibilidad de las etiquetas
            
            // Coloca el rectángulo verde
            Rectangle()
                .fill(Color(hex3: "20E2A5")) // Color en formato hexadecimal
                .frame(width: 45, height: 490)
                .cornerRadius(20)
                .rotationEffect(.degrees(42))
                .offset(y: 300) // Ajusta la posición vertical según tus necesidades
                .offset(x: 50)
            
            // Coloca el rectángulo gris
            Rectangle()
                .fill(Color(hex3: "DEDBDB")) // Color en formato hexadecimal
                .frame(width: 45, height: 300)
                .cornerRadius(20)
                .rotationEffect(.degrees(42))
                .offset(y: 80) // Ajusta la posición vertical según tus necesidades
                .offset(x: 150)
            
            // Coloca el rectángulo verde
            Rectangle()
                .fill(Color(hex3: "20E2A5")) // Color en formato hexadecimal
                .frame(width: 45, height: 400)
                .cornerRadius(20)
                .rotationEffect(.degrees(42))
                .offset(y: -100) // Ajusta la posición vertical según tus necesidades
                .offset(x: -150)
            
            // Coloca el rectángulo gris
            Rectangle()
                .fill(Color(hex3: "DEDBDB")) // Color en formato hexadecimal
                .frame(width: 45, height: 660)
                .cornerRadius(20)
                .rotationEffect(.degrees(42))
                .offset(y: -220) // Ajusta la posición vertical según tus necesidades
                .offset(x: -150)
            
            VStack {
                VStack {
                    // Texto de bienvenida
                    Text("¿Qué \nBuscas?")
                    
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 100)
                        .padding(.bottom, 100)
                    
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15)], spacing: 15) {
                            ForEach(tagExamples, id: \.self) { tag in
                                Button(action: {
                                    // Togglear la selección de etiquetas
                                    if selectedTags.contains(tag) {
                                        selectedTags.remove(tag)
                                    } else {
                                        // Verificar que no se hayan seleccionado más de 4 etiquetas
                                        if selectedTags.count < 4 {
                                            selectedTags.insert(tag)
                                        }
                                    }
                                }) {
                                    Text(tag)
                                        .padding()
                                        .background(selectedTags.contains(tag) ? Color.gray.opacity(0.5)  : Color.clear)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .cornerRadius(50)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color.black, lineWidth: 5)
                                        )
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Botón de confirmación
                Button(action: {
                    // Realiza alguna acción con las etiquetas seleccionadas, por ejemplo, guardarlas
                    print("Etiquetas seleccionadas: \(selectedTags)")
                }) {
                    Text("Confirmar")
                        .padding()
                        .background(selectedTags.isEmpty ? Color.clear : Color.gray.opacity(0.5))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .cornerRadius(20)
                        .disabled(selectedTags.isEmpty)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 5)
                        )
                        .padding(.bottom, 50)
                }
            }
        }
        .ignoresSafeArea()
    }
}

extension Color {
    // Extensión para crear un color desde un formato hexadecimal
    init(hex3: String) {
        let scanner = Scanner(string: hex3)
        var rgb: UInt64 = 0
        
        scanner.scanHexInt64(&rgb)
        
        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}

struct TagUser_Previews: PreviewProvider {
    static var previews: some View {
        TagUser()
    }
}
