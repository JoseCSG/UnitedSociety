import SwiftUI

struct HomeView: View {
    @State var feed:Bool = true;
    @Binding var publicationModel: PublicationModel
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                ZStack{
                    VStack(spacing: 0){
                        VStack{
                            HStack{
                                Image("LogoYCO")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth:2))
                                    .padding(.leading, 10)
                                Button {
                                    feed = true;
                                } label: {
                                    Text("Siguiendo")
                                        .padding(.trailing, 40)
                                        .bold()
                                        .tint(.black)
                                        .modifier(SelectedStyleFollow(isSelected: feed))
                                }
                                Button {
                                    feed = false;
                                } label: {
                                    Text("Organizaciones")
                                        .bold()
                                        .tint(.black)
                                        .modifier(SelectedStyleOrgs(isSelected: !feed))
                                }
                                NavigationLink{
                                    ProfileView()
                                } label: {
                                    Image("ProfileImage")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.black, lineWidth:2))
                                        .padding(.trailing, 10)
                                }
                            }
                        }.frame(height: geo.size.height/11)
                        ZStack{
                            if(feed){
                                FeedView(publicationModel: $publicationModel)
                                    .frame(height: 10*geo.size.height/11)
                            }
                            else {
                                OrganizationsView()
                                    .frame(height: 10*geo.size.height/11)
                            }
                            
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .toolbar(.hidden)
    }
}


struct SelectedStyleFollow: ViewModifier {
    var isSelected: Bool

    func body(content: Content) -> some View {
        if isSelected {
            return AnyView(content
                .overlay(
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(.blue)
                        .offset(y: 5)
                        .offset(x: -18)
                        .frame(width: 110),
                    alignment: .bottom
                )
                .transition(.opacity))
        } else {
            return AnyView(content
                .transition(.opacity))
        }
    }
}

struct SelectedStyleOrgs: ViewModifier {
    var isSelected: Bool

    func body(content: Content) -> some View {
        if isSelected {
            return AnyView(content
                .overlay(
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(.blue)
                        .offset(y: 5)
                        .frame(width: 140),
                    alignment: .bottom
                )
                .transition(.opacity))
        } else {
            return AnyView(content
                .transition(.opacity))
        }
    }
}
