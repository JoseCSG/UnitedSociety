//
//  PublicationCommentsView.swift
//  ProyectoApp
//
//  Created by Alumno on 11/10/23.
//

import SwiftUI

struct PublicationCommentsView: View {
    @Binding var comments: [Comment]
    @State var publicationID: String
    var body: some View {
        ZStack{
            ScrollView(.vertical){
                LazyVStack(spacing: 5){
                    ForEach(comments){com in
                        CommentView(comm: com)
                    }
                }
            }
        }
    }
}

