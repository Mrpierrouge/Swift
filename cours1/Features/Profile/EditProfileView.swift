//
//  EditProfileView.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @Bindable var user: UserProfileModel
    @State var selectedItem: PhotosPickerItem? = nil
    @State var showPhotoPicker = false
    
    var body: some View {
        Form {
            Section {
                VStack {
                    if let image = user.avatarImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .padding(.bottom, 10)
                    } else {
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 120, height: 120)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: 50))
                                    .foregroundStyle(.gray)
                            )
                            .padding(.bottom, 10)
                    }
                }
                Button("Changer la photo") {
                    showPhotoPicker = true
                }
                .buttonStyle(.borderedProminent)
                .photosPicker(
                    isPresented: $showPhotoPicker,
                    selection: $selectedItem,
                    matching: .images
                )
            }
            
            Section("Informations") {
                TextField("Nom d'utilisateur", text: $user.username)
                Stepper("Âge : \(user.age)", value: $user.age, in: 0...120)
            }
        }
        .navigationTitle("Modifier le profil")
        .onChange(of: selectedItem) {
            Task {
                if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    user.avatarImage = uiImage
                }
            }
        }
    }
}
