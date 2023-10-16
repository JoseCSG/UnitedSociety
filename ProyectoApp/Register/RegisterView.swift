//
//  LogIn.swift
//  United Society Us
//
//  Created by Luis Fernanando Cabral Fong on 31/08/23.
//


import SwiftUI

struct Register: View {
    @State private var selectedCountryCode = "+1"
    @State private var phoneNumber = ""
    @State private var isNavigating = false

    var countryCodes = ["+52", "+1"]
    var countries = ["🇲🇽", "🇺🇸"]

    var body: some View {
            ZStack {
                // Integra BackgroundView al fondo
                BackgroundView()
                
                VStack {
                    Text("Bienvenido(a) a United Society")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 100)
                        .padding(.bottom, 100)

                    HStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.clear)
                                .frame(width: 80, height: 40)
                                .cornerRadius(8)

                            Picker("Country Code", selection: $selectedCountryCode) {
                                ForEach(countryCodes.indices, id: \.self) { index in
                                    Text(countries[index])
                                }
                            }
                            .frame(width: 80)
                            .pickerStyle(MenuPickerStyle())
                        }

                        TextField("Phone Number", text: $phoneNumber)
                            .foregroundColor(Color.black.opacity(0.5))
                            .keyboardType(.phonePad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }

                    Button(action: {
                        let fullPhoneNumber = selectedCountryCode + phoneNumber
                        print("Número de teléfono completo: \(fullPhoneNumber)")
                        isNavigating = true
                    }) {
                        NavigationLink(destination: Pick_Role()) {
                            Text("Registrarte")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .frame(width: 280, height: 50)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 5)
                                )
                        }
                        .padding()
                    }
                    .padding(.horizontal)

                    Spacer()

                    HStack {
                        Spacer()
                    }
                    .alignmentGuide(.bottom) { d in d[.bottom] }
                }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .background(Color.clear)
    }
}
struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
