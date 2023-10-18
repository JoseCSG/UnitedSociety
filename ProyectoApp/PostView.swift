import SwiftUI
import _AVKit_SwiftUI
import Alamofire
import PhotosUI
import MediaPicker

struct PostView: View {
    
    @State private var title = ""
    @State private var description = ""
    @State private var selectedMediaItem: PhotosPickerItem? = nil
    @State private var selectedMediaURL: URL? = nil
    @State private var selectedMediaPreview: AnyView? = nil
    @State private var isShowingMediaPicker: Bool = false
    @State private var mediaType: MediaType? = nil
    @State var id: String
    @Binding var publicationModel: PublicationModel
    @Binding var showAddPub: Bool
    
    func getURL(item: PhotosPickerItem) async throws -> URL {
        let data = try await item.loadTransferable(type: Data.self)
        if let contentType = item.supportedContentTypes.first {
            let fileExtension = contentType.preferredFilenameExtension ?? ""
            let uniqueFileName = UUID().uuidString
            let url = getDocumentsDirectory().appendingPathComponent("\(uniqueFileName).\(fileExtension)")
            try data!.write(to: url)
            return url
        } else {
            throw URLError(.unsupportedURL)
        }
    }

    /// from: https://www.hackingwithswift.com/books/ios-swiftui/writing-data-to-the-documents-directory
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    var body: some View {
        VStack {
            Text("Nueva publicación")
                .font(.title)
                .bold()
                .padding()
            
            TextField("Titulo de la publicacion", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextEditor(text: $description)
                .frame(height: 150)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding()
            
            if let selectedMediaPreview = selectedMediaPreview {
                selectedMediaPreview
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
                    .cornerRadius(10)
                    .padding()
            }
            
            HStack {
                PhotosPicker(selection: $selectedMediaItem){
                    Image(systemName: "photo.on.rectangle")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                }
            }
            .onChange(of: selectedMediaItem) { newMediaItem in
                Task {
                    if let mediaItem = newMediaItem {
                        do {
                            let mediaURL = try await getURL(item: mediaItem)
                            if mediaURL.pathExtension.lowercased() == "mp4" {
                                mediaType = .video
                                selectedMediaPreview = AnyView(VideoPlayer(player: AVPlayer(url: mediaURL)))
                            } else {
                                mediaType = .photo
                                selectedMediaPreview = AnyView(Image(uiImage: UIImage(contentsOfFile: mediaURL.path) ?? UIImage(systemName: "photo")!)
                                    .resizable()
                                )
                                
                            }
                            selectedMediaURL = mediaURL
                        } catch {
                            print("Error getting media URL: \(error)")
                        }
                    }
                }
            }
            
            HStack {
                Spacer()
                Button(action: {
                    addPub()
                }) {
                    Text("Enviar")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: { showAddPub.toggle() }) {
                    Text("Cancelar")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 255/255, green: 0/255, blue: 0/255))
                        .cornerRadius(10)
                }
                .padding()
                Spacer()
            }
        }
        .onDisappear{
            Task {
                await publicationModel.fetchPublicationsOrg(id: id)
            }
        }
    }
    
    
    private func addPub() {
        Task {
            await publicationModel.postPublication(title: title, description: description, mediaURL: selectedMediaURL!, org_id: id)
            print(publicationModel.publications)
            showAddPub.toggle()
        }
    }
    
    enum MediaType {
        case photo
        case video
    }
}
