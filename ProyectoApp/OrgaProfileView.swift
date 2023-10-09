
import SwiftUI
import SwiftData
import MapKit


struct OrgaProfileView: View {
    @Query private var Publications: [Publication]
    @State var addPub: Bool = false
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Color(red: 55/255, green: 94/255, blue: 152/255)
                VStack{
                    MapView()
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 200)
                    
                    
                    CircleImage(image: Image(systemName: "home"))
                        .offset(y: -130)
                        .padding(.bottom, -130)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Asociacion")
                            .font(.title)
                        
                        
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
                        PublicationView(publication: Publication.dummy)
                        PublicationView(publication: Publication.dummy)
                        PublicationView(publication: Publication.dummy)
                            ForEach(Publications) { pub in
                                NavigationLink{
                                    PublicationDetailView(publication: pub)
                                } label: {
                                    PublicationView(publication: pub)
                                        .padding(.top, 10)
                                }
                                .tint(.black)
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                Button {
                    addPub.toggle()
                } label: {
                    Text("+")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 800)
                        .padding(.leading, 300)
                    
                }
            }
            .sheet(isPresented: $addPub, content: {
                PostView()
                    .presentationDetents([.large, .medium])
            })
        }
        .ignoresSafeArea()
    }
}


struct OrgaProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OrgaProfileView()
            .modelContainer(for: [Publication.self], inMemory: true)
        
    }
}
