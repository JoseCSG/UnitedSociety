import SwiftUI
import _AVKit_SwiftUI
import AVFoundation
import Kingfisher
import SwiftData

struct PublicationView: View {
    @State var upvote: Bool = false
    @State var downvote: Bool = false
    @State var postComment: Bool = false
    var publication: Publication
    @State var publicationModel = PublicationModel()
    @Query private var user: [User]
    
    func like() {
        if !upvote {
            publication.likes += 1
            publicationModel.likePub(id_pub: publication._id_mongo, id_user: "6524dfe1d805c888097581fd")
            if downvote {
                publication.likes += 1
                publicationModel.likePub(id_pub: publication._id_mongo, id_user: "6524dfe1d805c888097581fd")
                downvote.toggle()
            }
            
        } else {
            publication.likes -= 1
            publicationModel.dislikePub(id_pub: publication._id_mongo, id_user: "6524dfe1d805c888097581fd")
        }
        upvote.toggle()
        
    }
    func dislike(){
        if(!downvote){
            publication.likes -= 1
            publicationModel.dislikePub(id_pub: publication._id_mongo, id_user: "6524dfe1d805c888097581fd")

            if upvote {
                publication.likes -= 1
                publicationModel.dislikePub(id_pub: publication._id_mongo, id_user: "6524dfe1d805c888097581fd")
                upvote.toggle()
            }
        }
        else {
            publication.likes += 1
            publicationModel.likePub(id_pub: publication._id_mongo, id_user: "6524dfe1d805c888097581fd")
        }
        downvote.toggle()
    }
    
    var body: some View {
        
        NavigationLink(destination: PublicationDetailView(upvote: $upvote, downvote: $downvote, publication: publication))
        {
            VStack{
                ZStack {
                    Color.white
                        .opacity(0.5)
                    VStack {
                        HStack {
                            Text("")
                                .padding(.trailing, 55)
                            Text(publication.title)
                                .bold()
                                .padding(.bottom, 1)
                            Spacer()
                        }
                        if(publication.media_type == "mp4" || publication.media_type == "mov"){
                            VideoPlayer(player: AVPlayer(url: URL(string: publication.media)!))
                                .frame(height: 180)
                        }
                        else{
                            KFImage(URL(string: publication.media))
                                .resizable()
                                .frame(height: 180)
                        }
                        HStack {
                            if(user.last!.rol == "Usuario"){
                                Button(action: { like() }) {
                                    if upvote {
                                        Image("ArrowClicked")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .padding(.leading)
                                            .tint(.blue)
                                    } else {
                                        Image("Arrow")
                                            .resizable()
                                            .frame(height: 20)
                                            .frame(width: 20)
                                            .padding(.leading)
                                    }
                                }
                                Text(String(publication.likes))
                                Button(action: { dislike() }) {
                                    if downvote {
                                        Image("ArrowClicked")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .rotationEffect(Angle(degrees: 180))
                                    } else {
                                        Image("Arrow")
                                            .resizable()
                                            .frame(height: 20)
                                            .frame(width: 20)
                                            .rotationEffect(Angle(degrees: 180))
                                    }
                                }
                                Button {
                                    postComment.toggle()
                                } label: {
                                    Text("Comentarios")
                                    Text(String(publication.comments))
                                    Image("CommentIcon")
                                        .resizable()
                                        .frame(height: 20)
                                        .frame(width: 20)
                                }
                            }
                            else {
                                Text("Likes: ")
                                    .padding(.leading, 10)
                                Text(String(publication.likes))
                                Button {
                                    postComment.toggle()
                                } label: {
                                    Text("Comentarios")
                                    Text(String(publication.comments))
                                    Image("CommentIcon")
                                        .resizable()
                                        .frame(height: 20)
                                        .frame(width: 20)
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                //        HStack {
                        //    Text(publication.descption)
                          //      .padding(.top, 10)
                           //     .padding(.bottom, -4)
                     //   }
                    }
                    KFImage(URL(string: publication.img_org))
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .padding(.bottom, 210)
                        .padding(.trailing, 320)
                    
                }
            }
            .sheet(isPresented: $postComment, content: {
                PostCommentView(id_pub: publication._id_mongo, id_user: user.last!.user_id, publicationModel: $publicationModel, postComment: $postComment)
                    .presentationDetents([.medium])
            })
        }
        .onAppear{
            if(publication.liked){
                upvote = true
            }
        }
    }
}
