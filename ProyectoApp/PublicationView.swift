import SwiftUI
import Kingfisher

struct PublicationView: View {
    @State var upvote: Bool = false
    @State var downvote: Bool = false
    @State var postComment: Bool = false
    var publication: Publication
    @State var publicationModel = PublicationModel()
    
    func like() {
        print(publication.title)
        if !upvote {
            publication.likes += 1
            publicationModel.likePub(id_pub: publication._id_mongo)
            if downvote {
                publication.likes += 1
                publicationModel.likePub(id_pub: publication._id_mongo)
                downvote.toggle()
            }
            
        } else {
            publication.likes -= 1
            publicationModel.dislikePub(id_pub: publication._id_mongo)
        }
        upvote.toggle()
        
    }
    func dislike(){
        if(!downvote){
            publication.likes -= 1
            publicationModel.dislikePub(id_pub: publication._id_mongo)

            if upvote {
                publication.likes -= 1
                publicationModel.dislikePub(id_pub: publication._id_mongo)
                upvote.toggle()
            }
        }
        else {
            publication.likes += 1
            publicationModel.likePub(id_pub: publication._id_mongo)
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
                        KFImage(URL(string: publication.img))
                            .resizable()
                            .frame(height: 180)
                        HStack {
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
                                Image("CommentIcon")
                                    .resizable()
                                    .frame(height: 20)
                                    .frame(width: 20)
                            }
                            Text(String(publication.comments))
                            Text("Comentarios")
                            Spacer()
                        }
                //        HStack {
                        //    Text(publication.descption)
                          //      .padding(.top, 10)
                           //     .padding(.bottom, -4)
                     //   }
                    }
                    Image("IconEmpresa")
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
                PostCommentView(id_pub: publication._id_mongo, id_user: publication.id_user, publicationModel: $publicationModel, postComment: $postComment)
                    .presentationDetents([.medium])
            })
        }
    }
}
