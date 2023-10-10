import SwiftUI

struct HomeView: View {
    @State var feed:Bool = true;

    var body: some View {
        NavigationView{
            GeometryReader { geo in
                ZStack{
                    VStack(spacing: 0){
                        VStack{
                            HStack{
                                Image("LogoYCO")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .clipShape(.circle)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth:2))
                                    .padding(.leading, 20)
                                    .padding(.bottom, 20)
                                Spacer()
                                NavigationLink{
                                    ProfileView()
                                } label: {
                                    Image("ProfileImage")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .clipShape(.circle)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.black, lineWidth:2))
                                        .padding(.trailing, 20)
                                        .padding(.bottom, 20)
                                }
                            }
                            HStack{
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
                            }
                        }.frame(height: geo.size.height/7)
                        ZStack{
                            if(feed){
                                FeedView()
                                    .frame(height: 7*geo.size.height/8)
                            }
                            else {
                                OrganizationsView()
                                    .frame(height: 7*geo.size.height/8)
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


#Preview {
    HomeView()
}
