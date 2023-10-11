import SwiftUI
import Kingfisher

struct PublicationDetailView: View {
    @State var upvote: Bool = false
    @State var downvote: Bool = false
    var publication: Publication
    var comments =  PublicationModel()
    
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
                        Image("CommentIcon")
                            .resizable()
                            .frame(height: 20)
                            .frame(width: 20)
                        Text("4")
                            .padding(.trailing, -0)
                        Text("Comentarios")
                        Spacer()
                    }
                    HStack {
                        Text(publication.descption)
                            .padding(.top, 10)
                            .padding(.bottom, -4)
                    }
                }
                Image("IconEmpresa")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .padding(.bottom, 240)
                    .padding(.trailing, 320)
            }
            ScrollView(.vertical){
                ForEach(comments.comments){ com in
                    CommentView(upvote: false, downvote: false, name: com.name, likes: com.likes, comment: com.comment)
                }
            }
        }
        .onAppear{
            comments.fetchCommentsPub(id: publication._id_mongo)
        }
    }
}

#Preview{
    PublicationDetailView(publication: Publication(title: "Titulo dummy", img: "CanonSumidero", likes: 0, descption: "Una descripcion dummy", _id_mongo: "65249958f1af19c2f89ca73e"))
}
