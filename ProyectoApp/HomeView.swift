import SwiftUI
import SwiftData
import Kingfisher

struct HomeView: View {
    @State var feed:Bool = true;
    @Binding var publicationModel: PublicationModel
    @Query private var user: [User]
    var org = Organization.dummy
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                ZStack{
                    VStack(spacing: 0){
                        VStack{
                            HStack{
                                Image("Us")
                                    .resizable()
                                    .frame(width: 40, height: 50)
                                    .padding(.leading, 20)
                                    .padding(.bottom, 25)
                                Spacer()
                                if user.last!.rol == "Usuario"{
                                    Button {
                                        feed = true;
                                        Task{
                                            await publicationModel.fetchPublications(id_user: "6524dfe1d805c888097581fd")
                                        }
                                    } label: {
                                        Text("Siguiendo")
                                            .padding(.trailing, 40)
                                            .bold()
                                            .tint(.black)
                                            .modifier(SelectedStyleFollow(isSelected: feed))
                                    }
                                }
                                Spacer()
                                Button {
                                    feed = false;
                                } label: {
                                    Text("Organizaciones")
                                        .bold()
                                        .tint(.black)
                                        .modifier(SelectedStyleOrgs(isSelected: !feed))
                                }
                                Spacer()
                                if(user.last!.rol == "Usuario"){
                                    NavigationLink{
                                        ProfileView()
                                    } label: {
                                        KFImage(URL(string: user.last!.img))
                                            .resizable()
                                            .frame(width: 40, height: 50)
                                            .clipShape(.circle)
                                            .padding(.trailing, 10)
                                            .padding(.bottom, 25)
                                    }

                                }
                                else {
                                    NavigationLink{
                                        OrgaProfileView(org: org)
                                    } label : {
                                        KFImage(URL(string: org.img))
                                            .resizable()
                                            .frame(width: 40, height: 50)
                                            .clipShape(.circle)
                                            .padding(.trailing, 10)
                                            .padding(.bottom, 25)
                                    }
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
                        .foregroundColor(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
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
                        .foregroundColor(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
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
