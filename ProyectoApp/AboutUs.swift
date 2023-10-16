//
//  AboutUs.swift
//  ProyectoApp
//
//  Created by Luis Fernanando Cabral Fong on 13/10/23.
//

import SwiftUI

struct AboutUs: View {
    @State private var imgUrl: String
        @State private var orgname: String
        @State private var city: String
        @State private var vision: String
        @State private var direction: String
        @State private var postal_code: String
        @State private var colonia: String
        @State private var atention_hours: String
        @State private var email: String
        @State private var phoneNumber: String
        @State private var isProfileViewPresented = false

        // Initialize the view with an Organization instance
        init(org: Organization) {
            self.imgUrl = org.img
            self._orgname = State(initialValue: org.name)
            self._city = State(initialValue: org.municipio)
            self._vision = State(initialValue: "Fomentamos la participación ciudadana vinculando, desarrollando, empoderando a ONGs y líderes sociales con el fin de sumar al bienestar de todos")
            self._direction = State(initialValue: org.direccion)
            self._postal_code = State(initialValue: org.codigoPostal)
            self._colonia = State(initialValue: org.colonia)
            self._atention_hours = State(initialValue: org.atention_hours!)
            self._email = State(initialValue: org.email)
            self._phoneNumber = State(initialValue: org.numero)
        }

    let isActive = true
    
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    ImageProfileView(imageName: imgUrl)
                        .frame(width: 400, height: 300)
                    
                    VStack(alignment: .leading)  {
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                        Text(orgname)
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                        
                        Text(city)
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                        
                        Text(vision)
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                
                        Text(direction)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                        
                        Text(postal_code)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                        
                        Text(colonia)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                        
                        Text(atention_hours)
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                        
                        Text(email)
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        
                        
                        Text(phoneNumber)
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                    
                    }
                }
            }
        }
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs(org: Organization.dummy)
    }
}
