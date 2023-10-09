//
//  RegisterUser.swift
//  United Society Us
//
//  Created by Luis Fernanando Cabral Fong on 05/09/23.
//

import SwiftUI

struct RegisterUser: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
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
                // Texto de bienvenida
                Text("Registro")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 100)
                    .padding(.bottom, 30)
                
                Form {
                    Section(header: Text("Información Personal")) {
                        TextField("Nombre", text: $firstName)
                        TextField("Apellido", text: $lastName)
                    }

                    Section(header: Text("Información de Cuenta")) {
                        TextField("Correo Electrónico", text: $email)
                            .keyboardType(.emailAddress)
                        SecureField("Contraseña", text: $password)
                        SecureField("Confirmar Contraseña", text: $confirmPassword)
                    }
                }.background(Color.red)

                // Botón de registro
                Button(action: {
                    // Aquí puedes agregar la lógica de registro, por ejemplo, enviar datos al servidor
                    print("Registro exitoso")
                }) {
                    Text("Registrarse")
                        .padding()
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 5))
                }
                .padding(.bottom, 50)
            }
        }
        .ignoresSafeArea()
    }
}

struct RegisterUser_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUser()
    }
}
