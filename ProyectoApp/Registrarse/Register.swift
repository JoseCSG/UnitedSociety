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
        NavigationView {
            ZStack {
                Image("Us2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .offset(y: 300)
                    .offset(x: -70)
                    .edgesIgnoringSafeArea(.all)

                Color.white.opacity(0.7)
                Rectangle()
                    .fill(Color(hex: "20E2A5"))
                    .frame(width: 45, height: 550)
                    .cornerRadius(20)
                    .rotationEffect(.degrees(42))
                    .offset(y: 300)
                    .offset(x: 50)

                Rectangle()
                    .fill(Color(hex: "DEDBDB"))
                    .frame(width: 45, height: 300)
                    .cornerRadius(20)
                    .rotationEffect(.degrees(42))
                    .offset(y: 80)
                    .offset(x: 150)

                Rectangle()
                    .fill(Color(hex: "20E2A5"))
                    .frame(width: 45, height: 400)
                    .cornerRadius(20)
                    .rotationEffect(.degrees(42))
                    .offset(y: -100)
                    .offset(x: -150)

                Rectangle()
                    .fill(Color(hex: "DEDBDB"))
                    .frame(width: 45, height: 660)
                    .cornerRadius(20)
                    .rotationEffect(.degrees(42))
                    .offset(y: -220)
                    .offset(x: -150)

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
            .navigationBarHidden(true)
        }
    }
}

extension Color {
    static let customBlue = Color(red: 55/255, green: 94/255, blue: 152/255)

    init(hex2: String) {
        let scanner = Scanner(string: hex2)
        var rgb: UInt64 = 0

        scanner.scanHexInt64(&rgb)

        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
