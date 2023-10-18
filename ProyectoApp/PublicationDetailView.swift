import SwiftUI
import Kingfisher
import SwiftData

struct PublicationDetailView: View {
    @Binding var upvote: Bool
    @Binding var downvote: Bool
    @State var postComment: Bool = false
    var publication: Publication
    @State var publicationModel = PublicationModel()
    @Query private var user: [User]
    
    func like() {
        if !upvote {
            publication.likes += 1
            if downvote {
                publication.likes += 1
                downvote.toggle()
            }
            
        } else {
            publication.likes -= 1
        }
        upvote.toggle()
    }
    func dislike(){
        if(!downvote){
            publication.likes -= 1
            if upvote {
                publication.likes -= 1
                upvote.toggle()
            }
        }
        else {
            publication.likes += 1
        }
        downvote.toggle()
    }

    var body: some View {
        VStack{
            ZStack {
                Color.white
                VStack {
                    HStack{
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
                        Text(String(publication.likes))
                        Button(action: {dislike()}) {
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
                        Button {
                            postComment.toggle()
                        } label: {
                            Image("CommentIcon")
                                .resizable()
                                .frame(height: 20)
                                .frame(width: 20)
                        }
                        Text(String(publication.comments))
                            .padding(.trailing, -0)
                        Text("Comentarios")
                        Spacer()
                    }
                    HStack {
                        Text(publication.descption)
                            .padding(.top, 10)
                            .padding(.bottom, -4)
                    }
                    if(publicationModel.comments.isEmpty){
                        Text("No hay comentarios")
                        Spacer()
                    }
                    else {
                        ScrollView(.vertical){
                            LazyVStack(spacing: 5){
                                ForEach(publicationModel.comments){com in
                                    CommentView(comm: com)
                                }
                            }
                        }
                    }
                    
                }
                .padding(.top, 20)
                KFImage(URL(string: publication.img_org))
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .padding(.bottom, 660)
                    .padding(.trailing, 320)
            }
        }
        .sheet(isPresented: $postComment, content: {
            PostCommentView(id_pub: publication._id_mongo, id_user: user[0].user_id, publicationModel: $publicationModel, postComment: $postComment)
                .presentationDetents([.medium])
        })
        .onAppear{
            Task{
                await publicationModel.fetchCommentsPub(id: publication._id_mongo)
            }
        }
    }
}

