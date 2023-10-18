//
//  PublicationSmallView.swift
//  ProyectoApp
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI
import Kingfisher

struct PublicationSmallView: View {
    var img: String
    var name: String
    var id: String
    @Binding var userModel: UserModel
    var id_user: String
    @State var following: Bool = true
    
    var body: some View {
        HStack{
            KFImage(URL(string: img))
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.horizontal, 20)
            VStack(alignment: .leading){
                Text(name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                Button(action: {
                    if(following){
                        userModel.unfollowOrg(id_user: id_user, id_org: id)
                        following.toggle()
                    }
                    else{
                        userModel.followOrg(id_user: id_user, id_org: id)
                        following.toggle()
                    }
                }) {
                    if(following){
                        Text("Dejar de seguir")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 180, height: 40)
                            .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                            .cornerRadius(10)
                    }
                    else {
                        Text("Seguir de nuevo")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 180, height: 40)
                            .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                            .cornerRadius(10)
                    }
                }
            }
            Divider()
                .frame(height: 1.5)
                .background(Color.lightgray)
                .padding()
        }
    }
}
