//
//  OrganizationsView.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct OrganizationsView: View {
    var dummyPublication = Publication.dummy
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            VStack{
                
                ScrollView(.vertical){
                    Color.lightgray
                    //                VStack{
                    HStack{
                        TextField("Buscar organizacion", text: $searchText)
                            .padding()
                            .background(Color.lightgray)
                            .cornerRadius(10)
                            .padding(.horizontal, 50)
                            .padding(.top, 10)
                        //                        .padding(.bottom, 20)
                        //                        .frame(height: 100)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                           
                            NavigationLink(destination: OrgaProfileView()){
                                Image("IconEmpresa")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            }
                            NavigationLink(destination: OrgaProfileView()){
                                Image("IconEmpresa2")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            }
                            NavigationLink(destination: OrgaProfileView()){
                                Image("IconEmpresa3")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            }
                            NavigationLink(destination: OrgaProfileView()){
                                Image("IconEmpresa4")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                //Aqui
                                
                            }
                                
                            
                            .padding(.horizontal, 20)
                            
                        }
                        .padding(.vertical, 20)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(0..<5) { index in
                                Image("Space")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(10)
                                    .padding(.bottom, 60)
                                
                                    Image("IconEmpresa")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                        .offset(x: -170, y: -90)
                                    
                                    
                                
                                //Aqui
                            }
                        }
                        .padding(.horizontal, 20)
                        
                    }
                    .padding(.vertical, 20)
                    
                    //    ScrollView(.horizontal, showsIndicators: false){
                    //      HStack(spacing: 20){
                    //        ForEach(0..<5) { index in
                    //      Image("IconEmpresa")
                    //        .resizable()
                    //      .frame(width: 150, height: 150)
                    //    .clipShape(Circle())
                    
                    // Image("IconEmpresa")
                    //   .resizable()
                    // .frame(width: 150, height: 150)
                    //.clipShape(Circle())
                    //Aqui
                    // }
                    //}
                    //}
                    //.padding(.horizontal, 20)
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<5) { index in
                                NavigationLink(destination: PublicationView(publication: dummyPublication)){
                                    Image("CanonSumidero")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(10)
                                }
                                Image("IconEmpresa")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .offset(x: -170, y: -56)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        //                    .frame(height: 200)
                        //                    .padding(.vertical, 10)
                    }
                    .padding(.vertical, 20)
                    
                    //            }
                    
                }
            }
            
        }
    }
}
#Preview {
    OrganizationsView()
}

