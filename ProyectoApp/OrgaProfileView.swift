
import SwiftUI
import SwiftData
import MapKit
import Kingfisher

enum UserRol {
    case usuario
    case asociacion
}



struct OrgaProfileView: View {
    @State var addPub: Bool = false
    @State var publicationModel = PublicationModel()
    var organizationModel = OrganizationModel()
    @State var org: Organization
    @Query private var user: [User]
    @State var userRol = ""
    @State var following = false
    let vision = "Fomentamos la participación ciudadana vinculando, desarrollando, empoderando a ONGs y líderes sociales con el fin de sumar al bienestar de todos"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ImageProfileView(imageName: org.img)
                        .frame(width: 90, height: 90, alignment: .leading )
                        .padding(.horizontal, 20)
                    
                    VStack(alignment: .leading) {
                        Text(org.name)
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                        
                        Text(org.municipio)
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                        
                        NavigationLink (destination: Followers()){
                            Text(String(org.followers))
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(height: 30)
                                .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                .cornerRadius(5)
                        }
                        
                        
                    }
                    Spacer()
                }
                
                VStack {
                    Text("Vision")
                        .padding(.horizontal, 10)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(vision)
                        .font(.subheadline)
                }
                
                HStack {
                    VStack {
                        Text("Nuestro Campo")
                            .padding(.horizontal, 10)
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .padding(.bottom, 5)
                    }
                    .fixedSize(horizontal: true, vertical: false)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            Color.clear
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                            
                            HStack {
                                ForEach(org.tags, id: \.self) { tag in
                                    Text(tag)
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                        .background(Color.lightgray)
                                        .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.clear, lineWidth: 3))
                                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                        .frame(height: 30)
                        .padding(.horizontal, 5)
                    }
                }
                
                .padding(.vertical, 5)
                HStack {
                    if (userRol == "Asociacion" && org.id == user[0].user_id){
                        NavigationLink(destination: EditOrgaProfileView(org: org)) {
                            Text("Editar Perfil")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 120, height: 40)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                                .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                .cornerRadius(10)
                        }
                        Button(action: {addPub.toggle()}, label: {
                            Text("Publicar")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 120, height: 40)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                                .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                .cornerRadius(10)
                        })
                    }
                    if userRol == "Usuario" {
                        NavigationLink(destination: AboutUs(org: org)) {
                            Text("Acerca de")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 120, height: 40)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                                .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                .cornerRadius(10)
                        }
                        
                        Button {
                            organizationModel.followOrg(id_usuario: "6524dfe1d805c888097581fd", id_org: org.id)
                            org.followers += 1
                            following.toggle()
                        } label: {
                            if following {
                                Text("Dejar de seguir")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 40)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 5)
                                    .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                    .cornerRadius(10)
                            }
                            else {
                                Text("Seguir")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 40)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 5)
                                    .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                
                Divider()
                    .frame(height: 1.5)
                    .background(Color.lightgray)
                    .padding()
                ScrollView(.vertical){
                    if(publicationModel.publications.isEmpty){
                        VStack{
                            Text("No hay publicaciones")
                        }
                        .foregroundColor(.white)
                        Spacer()
                    }
                    else
                    {
                        ForEach(publicationModel.publications) { pub in
                            PublicationView(publication: pub)
                                .foregroundColor(.black)
                        }
                        .ignoresSafeArea()
                        
                    }
                }
                Spacer()
            }
            .fullScreenCover(isPresented: $addPub){
                PostView(id: org.id, publicationModel: $publicationModel, showAddPub: $addPub)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            Task{
                await publicationModel.fetchPublicationsOrg(id: org.id)
            }
            userRol = user[0].rol
        }
    }
}
