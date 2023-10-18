//
//  OrgMostLikedPubsView.swift
//  ProyectoApp
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI
import Kingfisher
import AVFoundation
import _AVKit_SwiftUI

struct OrgMostLikedPubsView: View {
    @State var org: Organization
    @State var upvote: Bool = false
    @State var downvote: Bool  = false
    @State private var selectedMediaPreview: AnyView? = nil

    var body: some View {
        VStack(alignment:.leading){
            HStack{
                NavigationLink(destination: OrgaProfileView(org: org)){
                    KFImage(URL(string: org.img))
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .padding(.leading, 10)
                }
                
                Text(org.name)
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading, 1) // Añadir relleno a la izquierda para mover el texto hacia la izquierda
                
                // Agregar los botones de las etiquetas aquí
                ForEach(org.tags, id: \.self){tag in
                    Button(action: {
                        
                    }) {
                        Text(tag)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .background(Color.lightgray)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.clear, lineWidth: 3))
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                            .padding(.horizontal, 5)
                    }
                    
                }
            }.frame(alignment: .leading)
            
            ZStack {
                Color.white
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        if(!org.mostLikedPubs.isEmpty){
                            ForEach(org.mostLikedPubs) { pub in
                                NavigationLink(destination: PublicationDetailView(upvote: $upvote, downvote: $downvote ,publication: pub)){
                                    if(pub.media_type == "mp4"){
                                        SmallVideoPlayerView(link: URL(string: pub.media)!)
                                    }
                                    else{
                                        KFImage(URL(string: pub.media))
                                            .resizable()
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(10)
                                            .aspectRatio(contentMode: .fill)
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: 170)
                    .padding(.horizontal, 20)
                }
            }
            
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    OrgMostLikedPubsView(org: Organization.dummy)
}
