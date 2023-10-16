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
            BackgroundView() // Agrega el fondo común

            VStack {
                // Texto de bienvenida
                Text("Registro")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)

                // Información personal
                TextField("Nombre", text: $firstName)
                    .padding()
                    .frame(width: 300)
                    .background(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 5))
                    .padding(.bottom, 20)
                    .foregroundColor(.black)
                
                TextField("Apellido", text: $lastName)
                    .padding()
                    .background(Color.clear)
                    .frame(width: 300)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 5))
                    .padding(.bottom, 20)

                // Información de cuenta
                TextField("Correo Electrónico", text: $email)
                    .keyboardType(.emailAddress)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 300)
                    .background(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 5))
                    .padding(.bottom, 20)

                SecureField("Contraseña", text: $password)
                    .padding()
                    .frame(width: 300)
                    .foregroundColor(.black)
                    .background(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 5))
                    .padding(.bottom, 20)

                SecureField("Confirmar Contraseña", text: $confirmPassword)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 300)
                    .background(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 5))
                    .padding(.bottom, 20)

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
                        .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 5))
                }
                .padding(.bottom, 50)
            }
            .ignoresSafeArea()
        }
    }
}

struct RegisterUser_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUser()
    }
}
