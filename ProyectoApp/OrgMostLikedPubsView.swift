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
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    // Agregar más botones de etiquetas según sea necesario
                }
            }
            
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
                                        if let videoURL = URL(string: pub.media) {
                                            VideoPlayer(player: AVPlayer(url: videoURL))
                                                .frame(height: 180)
                                        } else {
                                            Text("Invalid video URL")
                                        }
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
                            VideoPlayer(player: AVPlayer(url: URL(string: "https://firebasestorage.googleapis.com:443/v0/b/united-society-fad81.appspot.com/o/publications%2F986E973E-BFE2-40FB-B89B-ED75CDBBD647?alt=media&token=9540a694-1b01-4977-961f-87c3ea470b40")!))
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
