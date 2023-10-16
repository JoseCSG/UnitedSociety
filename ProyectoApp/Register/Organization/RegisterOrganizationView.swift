//
//  RegisterAsociation.swift
//  United Society Us
//
//  Created by Luis Fernanando Cabral Fong on 04/09/23.
//

import SwiftUI

struct RegisterAssociation: View {
    @State private var associationName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        ZStack {
            BackgroundView() // Agrega el fondo común

            VStack {
                Text("Registro de Asociación")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)

                TextField("Nombre de la Asociación", text: $associationName)
                    .padding()
                    .frame(width: 300)
                    .background(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 5))
                    .padding(.bottom, 20)
                    .foregroundColor(.black)

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

                Button(action: {
                    // Agregar lógica de registro de la Asociación
                    print("Registro exitoso de la Asociación")
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
        }
        .ignoresSafeArea()
    }
}

struct RegisterAssociation_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAssociation()
    }
}
