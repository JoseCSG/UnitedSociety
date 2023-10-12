//
//  PostView.swift
//  ProyectoApp
//
//  Created by Josue Sosa on 25/09/23.
//

import SwiftUI
import Alamofire
import PhotosUI

struct PostView: View {
  
    @State private var title = ""
    @State private var description = ""
    @State private var selectedImageItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    @State private var selectedUIImage: UIImage? = nil
    @State var id: String
    @Binding var publicationModel: PublicationModel
    @Binding var showAddPub: Bool
    var body: some View {
        
        VStack {
            TextField("Escribe el titulo de la publicacion", text: $title)
                .padding()
            TextField("Escribe la descripcion", text: $description)
                .padding()
            PhotosPicker(selection: $selectedImageItem){
                Text("Choose an image")
            }
            
            if let selectedImage{
                selectedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            
            
            Button {
                addPub()
            } label: {
                Text("Enviar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .onChange(of: selectedImageItem) { _ in
                       Task {
                    if let data = try? await selectedImageItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                         //   selectedImage = Image(uiImage: uiImage)
                            selectedUIImage = uiImage
                         //   return
                        }
                    }
        
                    print("Failed")
                }
            }
    }
    
    private func addPub(){
        withAnimation {
            Task{
               await publicationModel.postPublication(title: title, description: description, img: selectedUIImage!, org_id: id)
                publicationModel.fetchPublicationsOrg(id: id)
            }
        }
    }
}
