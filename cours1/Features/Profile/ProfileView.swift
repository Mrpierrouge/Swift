//
//  ProfileView.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//

import PhotosUI
import SwiftUI

struct ProfileView: View {
    @State var allUsers = [
        UserProfileModel(),
        UserProfileModel(),
        UserProfileModel()
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        HStack(spacing: 16) {
                            if let image = user.avatarImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                            } else {
                                Circle()
                                    .fill(.gray.opacity(0.2))
                                    .frame(width: 80, height: 80)
                                    .overlay(
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 30))
                                            .foregroundStyle(.gray)
                                    )
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(user.username)
                                    .font(.headline)
                                Text("Âge : \(user.age)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                NavigationLink("Modifier le profil") {
                                    EditProfileView(user: user)
                                }
                                .font(.callout)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.ultraThinMaterial)
                                .shadow(radius: 3)
                        )
                        .padding(.horizontal)
                        
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Profils utilisateurs")
            .background(
                LinearGradient(colors: [.blue.opacity(0.1), .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
        }
    }
}
