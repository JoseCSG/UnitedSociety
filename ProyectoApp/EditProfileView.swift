//
//  EditProfileView.swift
//  ProyectoApp
//
//  Created by Luis Fernanando Cabral Fong on 12/10/23.
//

import SwiftUI
import SwiftData

struct EditProfileView: View {
    @State private var name = "Emmanuel Macron"
    @State private var location = "Paris, France"
    @State private var age = "49 años"
    @State private var gender = "Hombre"
    @State private var email = "emmanuel@example.com"
    @State private var phoneNumber = "+1234567890"
    @State private var isProfileViewPresented = false
    @Query private var user: [User]

    let isActive = true
    
    var body: some View {
        NavigationView {
            VStack{
                ImageProfileView(imageName: user.last!.img)
                    .frame(width: 200, height: 200)
                
                Text(name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
                
                VStack(alignment: .center)  {
                    
                    TextField("Ubicación", text: $location)
                        .padding()
                        .frame(width: 300)
                        .background(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                        .padding(.bottom, 20)
                        .foregroundColor(.black)
                    
                    TextField("Edad", text: $age)
                        .padding()
                        .frame(width: 300)
                        .background(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                        .padding(.bottom, 20)
                        .foregroundColor(.black)
                    
                    TextField("Género", text: $gender)
                        .padding()
                        .frame(width: 300)
                        .background(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                        .padding(.bottom, 20)
                        .foregroundColor(.black)
                    
                    TextField("Correo Electrónico", text: $email)
                        .padding()
                        .frame(width: 300)
                        .background(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                        .padding(.bottom, 20)
                        .foregroundColor(.black)
                    
                    TextField("Número de Teléfono", text: $phoneNumber)
                        .padding()
                        .frame(width: 300)
                        .background(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                        .padding(.bottom, 20)
                        .foregroundColor(.black)
                    
                    
                    Button(action: {
                        isProfileViewPresented = true
                    }) {
                        Text("Guardar cambios")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                            .cornerRadius(10)
                    }
                    
                }                
            }
        }
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
