//
//  CommentView.swift
//  ProyectoApp
//
//  Created by Alumno on 02/10/23.
//

import SwiftUI

struct CommentView: View {
    @State var upvote: Bool = false
    @State var downvote: Bool = false
    @State var comm: Comment
    var body: some View {
        
        ZStack{
            Color.lightgray
            VStack{
                Text(comm.name)
                    .bold()
                    .padding(.trailing, 150)
                    .padding(.bottom, 10)
                Text(comm.comment)
                    .font(.callout)
                HStack {
                    Button(action: {print(comm)}) {
                        if(upvote){
                            Image("ArrowClicked")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.leading)
                                .tint(.blue)
                        }
                        else{
                            Image("Arrow")
                                .resizable()
                                .frame(height: 20)
                                .frame(width: 20)
                                .padding(.leading)
                        }
                    }
                    Text(String(comm.likes))
                    Button(action: {}) {
                        if(downvote){
                            Image("ArrowClicked")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .rotationEffect(Angle(degrees: 180))
                        }
                        else{
                            Image("Arrow")
                                .resizable()
                                .frame(height: 20)
                                .frame(width: 20)
                                .rotationEffect(Angle(degrees: 180))
                            
                        }
                    }
                    Spacer()
                }
            }
        }
        .frame(height: 100)
        .padding(.bottom, 10)
    }
}
