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
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismis
    @State private var title = ""
    @State private var description = ""
    @State private var selectedImageItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    
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
                let newPub = Publication(title: title, img: "CanonSumidero", likes: 0, descption: description)
                modelContext.insert(newPub)
                title = ""
                description = ""
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
                            selectedImage = Image(uiImage: uiImage)
                            return
                        }
                    }
                    
                    print("Failed")
                }
            }
    }
    
    private func addPub(){
        withAnimation {
            let newPub = Publication(title: title, img: "CanonSumidero", likes: 0, descption: description)
            modelContext.insert(newPub)
            title = ""
            description = ""
            
        }
    }
}


#Preview {
    PostView()
        .modelContainer(for: [Publication.self], inMemory: true)
}
