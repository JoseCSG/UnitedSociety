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
            Text("Nueva publicación")
                .font(.title)
                .padding()
            
            TextField("Titulo de la publicacion", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextEditor(text: $description)
                .frame(height: 150)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding()
            HStack {
                if let selectedImage = selectedImage {
                    selectedImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .cornerRadius(10)
                        .padding()
                }

            }
            .onChange(of: selectedImageItem) { _ in
                Task {
                    if let data = try? await selectedImageItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            selectedImage = Image(uiImage: uiImage)
                            selectedUIImage = uiImage
                            return
                        }
                    }
                    
                    print("Failed")
                }
            }
            
            PhotosPicker(selection: $selectedImageItem){
                Image(systemName: "photo.on.rectangle")
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 32.0/255, green: 226.0/255, blue: 165.0/255))
            }
            HStack{
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
                
                Button(action: {showAddPub.toggle()}){
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
    }
        
        private func addPub(){
            Task{
                await publicationModel.postPublication(title: title, description: description, img: selectedUIImage!, org_id: id)
                publicationModel.fetchPublicationsOrg(id: id)
                showAddPub.toggle()
            }
        }
    }
