//
//  LogInView.swift
//  ProyectoApp
//
//  Created by Luis Fernanando Cabral Fong on 12/10/23.
//

import SwiftUI

struct LogInView: View {
    @State private var selectedCountryCode = "+1"
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var isNavigating = false

    var countryCodes = ["+52", "+1"]
    var countries = ["🇲🇽", "🇺🇸"]
    @State var publicationModel = PublicationModel()

    var body: some View {
            ZStack {
                // Integra BackgroundView al fondo
                BackgroundView()
                
                VStack {
                    Text("Es Bueno Tenerte de Vuelta")
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
                        NavigationLink(destination: HomeView(feed: true, publicationModel: $publicationModel)) {
                            Text("Log In")
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
                    NavigationLink(destination: Register()){
                        Text("Eres nuevo? Registrate!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.top, 100)
                            .padding(.bottom, 100)
                    }

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
            .navigationBarHidden(true)
            .onAppear{
                Task{
                    await publicationModel.fetchPublications(id_user: "6524dfe1d805c888097581fd")
                }
            }
    }
}
struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
