//  CommentView.swift
//  ProyectoApp
//
//  Created by Josue Sosa on 05/10/23.
//

import SwiftUI
import Alamofire
import SwiftData

struct PostCommentView: View {
    
    @State private var description = ""
    @State var id_pub: String
    @State var id_user: String
    @Binding var publicationModel: PublicationModel
    @Binding var postComment: Bool
    
    var body: some View {
        
        Text("Escribe tu comentario:")
        
        VStack {
            
            ZStack{
                Color.gray.opacity(0.2)
                    .cornerRadius(8)
                TextEditor( text: $description)
                    .cornerRadius(8)
                    .padding(3)
            }
            Spacer()
            
            Button{
                // Aquí realizamos la solicitud POST con Alamofire
                submitComment()
            } label: {
                Text("Confirmar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.bottom, 50)
            }
        }
        .padding()
    }
    func submitComment(){
        Task{
            await publicationModel.postComment(id_pub: id_pub, id_user: id_user, comment: description)
             await publicationModel.fetchCommentsPub(id: id_pub)
            postComment.toggle()
        }
    }
}
