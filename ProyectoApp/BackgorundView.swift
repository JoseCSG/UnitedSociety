//
//  BackgroundView.swift
//  ProyectoApp
//
//  Created by Luis Fernanando Cabral Fong on 11/10/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Image("Us")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .offset(y: 300)
                .offset(x: -70)
                .edgesIgnoringSafeArea(.all)

            Color.white.opacity(0.7)
            Rectangle()
                .fill(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                .frame(width: 45, height: 550)
                .cornerRadius(20)
                .rotationEffect(.degrees(42))
                .offset(y: 300)
                .offset(x: 50)

            Rectangle()
                .fill(Color(red: 222.0/255, green: 219.0/255, blue: 219.0/255))
                .frame(width: 45, height: 300)
                .cornerRadius(20)
                .rotationEffect(.degrees(42))
                .offset(y: 80)
                .offset(x: 150)

            Rectangle()
                .fill(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                .frame(width: 45, height: 400)
                .cornerRadius(20)
                .rotationEffect(.degrees(42))
                .offset(y: -100)
                .offset(x: -150)

            Rectangle()
                .fill(Color(red: 222.0/255, green: 219.0/255, blue: 219.0/255))
                .frame(width: 45, height: 660)
                .cornerRadius(20)
                .rotationEffect(.degrees(42))
                .offset(y: -220)
                .offset(x: -150)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
