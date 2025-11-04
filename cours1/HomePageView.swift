//
//  ContentView.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Image plein écran
                Image(.avatar)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer() // pousse tout vers le bas pour centrer
                    Text("mainTitle")
                        .font(.system(size: 48, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color("blue"), Color("purple")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 2, y: 2)
                    
                    // Un peu d’espace entre le texte et le bouton
                    Spacer().frame(height: 40)
                    
                    // Bouton stylisé
                    NavigationLink(destination: ProfileView()) {
                        Text("mainButtonSubtitle")
                            .font(.headline)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(
                                    colors: [Color("blue"), Color("purple")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .shadow(color: .black.opacity(0.3), radius: 6, x: 2, y: 2)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomePageView()
}
