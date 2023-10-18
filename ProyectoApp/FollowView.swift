//
//  FollowView.swift
//  ProyectoApp
//
//  Created by Luis Fernanando Cabral Fong on 13/10/23.
//

import SwiftUI
import SwiftData
import SwiftyJSON
import Kingfisher

enum UserRoll {
    case usuario
    case asociacion
}

struct FollowView: View {
    // Variables para los datos del perfil
    @State private var orgname = "Consejo Civico"
    // Variable para el rol (usuario o asociación)
    @Query private var user: [User]
    @State var userModel = UserModel()
    var userRoll: UserRoll = .usuario
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading){
                        Text("Seguidos")
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity)
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                        
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.lightgray)
                            .padding()
                        ScrollView{
                            ForEach(userModel.orgsFollowed){ org in
                                PublicationSmallView(img: org.img, name: org.name, id: org.id, userModel: $userModel, id_user: user[0].user_id)
                            }
                            
                        }
                    }
                }
            }
            
        }
        .onAppear{
            userModel.fetchOrgsFollowed(id_user: "6524dfe1d805c888097581fd")
        }
    }
    
    struct FollowView_Previews: PreviewProvider {
        static var previews: some View {
            FollowView()
        }
    }
}
