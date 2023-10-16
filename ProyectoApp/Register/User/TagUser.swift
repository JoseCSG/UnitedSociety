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
                BackgroundView() // Agrega el fondo común

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
                                            .background(selectedTags.contains(tag) ? Color.gray.opacity(0.5) : Color.clear)
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
                    NavigationLink(destination: RegisterUser()) {
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
            }
            .ignoresSafeArea()
    }
}
