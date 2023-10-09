import SwiftUI

struct PublicationView: View {
    @State var upvote: Bool = false
    @State var downvote: Bool = false
    var publication: Publication

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
                        Image(publication.img)
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
                            Text("20")
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
        }
    }
}

#Preview{
    PublicationView(publication: Publication(title: "Titulo dummy", img: "CanonSumidero", likes: 0, descption: "Una descripcion dummy"))
}
