//
//  OrganizationsView.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI
import Kingfisher

struct OrganizationsView: View {
    var dummyPublication = Publication.dummy
    @State private var searchText = ""
    @State var upvote: Bool = false
    @State var downvote: Bool = false
    var organizationModel = OrganizationModel()
    var body: some View {
        NavigationView{
            VStack{
                
                ScrollView(.vertical){
                    HStack{
                        TextField("Buscar organizacion", text: $searchText)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Agrega sombra al fondo
                            .padding(.horizontal, 50)
                            .padding(.top, 10)
                            .onChange(of: searchText, initial: false){
                                if(searchText == ""){
                                    organizationModel.fetchOrganizations(id_user: "6524dfe1d805c888097581fd")
                                }
                                else{
                                    organizationModel.fetchOrganizationsName(name: searchText)
                                }
                            }
                            
                        //                        .padding(.bottom, 20)
                        //                        .frame(height: 100)
                    }
                    
                    VStack(alignment: .leading) {
                        if(searchText == ""){
                            Text("Coiciden con tus Tags")
                                .padding(.horizontal, 10)
                                .font(.system(size: 20))
                                .bold()
                        }
                        else {
                            Text("Organizaciones encontradas")
                                .padding(.horizontal, 10)
                                .font(.system(size: 20))
                                .bold()
                        }
                
                        // Puedes ajustar el estilo del título según tus preferencias
                        ScrollView(.horizontal, showsIndicators: false){
                            VStack{
                                ZStack{
                                    Color.white
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2) // Agrega sombra al fondo
                                    HStack(spacing: 10){
                                        if(!organizationModel.organizations.isEmpty){
                                            ForEach(organizationModel.organizations){ org in
                                                NavigationLink(destination: OrgaProfileView(org: org)){
                                                    KFImage(URL(string: org.img))
                                                        .resizable()
                                                        .frame(width: 100, height: 100)
                                                        .clipShape(Circle())
                                                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                                                }
                                            }
                                        }
                                    }
                                    .frame(height: 130)
                                    .padding(.horizontal, 20)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                        .padding(.vertical, 5)
                    }
                    
                    ForEach(organizationModel.organizations){ org in
                        OrgMostLikedPubsView(org: org)
                    }

                }
            }
            .onAppear {
                organizationModel.fetchOrganizations(id_user: "6524dfe1d805c888097581fd")
            }
        }
        .background(Color.lightgray)
        
    }
}
#Preview {
    OrganizationsView()
}

