import SwiftUI
import Kingfisher

struct CommentView: View {
    @State var upvote: Bool = false
    @State var downvote: Bool = false
    @State var comm: Comment

    var body: some View {
        HStack(alignment: .center) {
            KFImage(URL(string: comm.img))
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.trailing, 10)
                .padding(.leading, 10)

            VStack(alignment: .leading) {
                Text(comm.name)
                    .bold()
                    .padding(.bottom, 10)

                Text(comm.comment)
                    .font(.callout)
                    .padding(.bottom, 10)

                HStack {
                    Button(action: { print(comm) }) {
                        if upvote {
                            Image("ArrowClicked")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .tint(.blue)
                        } else {
                            Image("Arrow")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                    Text(String(comm.likes))
                    Button(action: {}) {
                        if downvote {
                            Image("ArrowClicked")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .rotationEffect(Angle(degrees: 180))
                        } else {
                            Image("Arrow")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .rotationEffect(Angle(degrees: 180))
                        }
                    }
                    Spacer()
                }
            }
            .padding(.top, 10)
            Spacer() // This is to ensure content is left aligned if there's more space
        }
        .background(Color.lightgray)
        .frame(height: 100)
        .padding(.bottom, 10)
        .padding(.top, 10)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comm: Comment(id: "234239842", comment: "Un comentario este peude estar muuy largo", likes: 2, name: "El nombre de quin eescribio", img: "https://firebasestorage.googleapis.com:443/v0/b/united-society-fad81.appspot.com/o/publications%2F6DD34CBC-46AE-40E7-AE47-B39F26D36074?alt=media&token=72585d82-7885-4b05-ad8f-7b884fe7d901"))
    }
}
