//
//  EditOrgaProfileView.swift
//  ProyectoApp
//
//  Created by Luis Fernanando Cabral Fong on 13/10/23.
//

import SwiftUI

struct EditOrgaProfileView: View {
    @State private var orgname: String
    @State private var city: String
    @State private var vision = "Fomentamos la participación ciudadana vinculando, desarrollando, empoderando a ONGs y líderes sociales con el fin de sumar al bienestar de todos"
    @State private var direction: String
    @State private var postal_code: String
    @State private var colonia: String
    @State private var atention_hours: String
    @State private var email: String
    @State private var phoneNumber: String
    @State private var imageURl: String
    @State private var isProfileViewPresented = false
    init(org: Organization){
        self.imageURl = org.img
        self.orgname = org.name
        self.city = org.municipio
        self.direction = org.direccion
        self.postal_code = org.codigoPostal
        self.colonia = org.colonia
        self.atention_hours = org.atention_hours!
        self.email = org.email
        self.phoneNumber = org.numero
    }
    
    let isActive = true
    
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    ImageProfileView(imageName: imageURl)
                        .frame(width: 200, height: 200)
                    
                    VStack(alignment: .center)  {
                        TextField("Nombre", text: $orgname)
                            .padding()
                            .frame(width: 300)
                            .background(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        TextField("Ubicación", text: $city)
                            .padding()
                            .frame(width: 300)
                            .background(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        TextField("Visión", text: $vision)
                            .padding()
                            .frame(width: 300)
                            .background(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                
                        TextField("Direccion", text: $direction)
                            .padding()
                            .frame(width: 300)
                            .background(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        TextField("Codigo Postal", text: $postal_code)
                            .padding()
                            .frame(width: 300)
                            .background(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        TextField("Colonia", text: $colonia)
                            .padding()
                            .frame(width: 300)
                            .background(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5))
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        TextField("Horario de atencion", text: $atention_hours)
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
}

struct EditOrgaProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditOrgaProfileView(org: Organization.dummy)
    }
}
