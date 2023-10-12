
import SwiftUI
import SwiftData
import MapKit
import Kingfisher


struct OrgaProfileView: View {
    @State var addPub: Bool = false
    @State var publicationModel = PublicationModel()
    @State var upvote: Bool = false
    @State var downvote: Bool = false
    @State var org: Organization
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Color(red: 55/255, green: 94/255, blue: 152/255)
                VStack{
                    VStack{
                        MapView(latitud: org.latitud, longitud: org.longitud)
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 200)
                        
                        KFImage(URL(string: org.img))
                            .resizable()
                            .frame(width: 150, height: 150)  // Set the size of the circular image
                            .clipShape(Circle())  // Make the image circular
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))  // Add a white border to the image
                            .padding(.top, -80)
                        

                        
                        VStack(alignment: .leading) {
                            HStack{
                                Text(org.name)
                                    .font(.title)
                                Spacer()
                                Button {
                                    addPub.toggle()
                                } label: {
                                    Text("+")
                                        .font(.title)
                                        .bold()
                                        .padding(.trailing)
                                        .tint(.black)
                                }
                            }
                            HStack {
                                Text("Monterrey")
                                Spacer()
                                Text("Nuevo Leon")
                            }
                            .font(.subheadline)
                            .foregroundColor(.white)
                            
                            
                            Divider()
                                .frame(height: 1.5)
                                .overlay(Color.white)
                            
                            Text("About asosiacion")
                                .font(.title2)
                            Text("Publicaciones")
                            
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
                        .foregroundColor(.white)
                        .padding()
                    }
                }
                .sheet(isPresented: $addPub, content: {
                    PostView(id: org.id, publicationModel: $publicationModel, showAddPub: $addPub)
                        .presentationDetents([.medium])
                })
            }
        }
        .ignoresSafeArea()
        .onAppear {
            publicationModel.fetchPublicationsOrg(id: org.id)
        }
    }
}

#Preview {
    OrgaProfileView(org: Organization.dummy)
}
