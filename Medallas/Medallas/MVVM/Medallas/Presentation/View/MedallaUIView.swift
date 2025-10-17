//
//  MedallaUIView.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import SwiftUI

struct MedallaUIView: View {
    
    private enum Constants {
        static let iconProfile = "ic_profile"
    }
    
    @ObservedObject var viewModel: MedallaViewModel
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 60)
            Image(Constants.iconProfile)
                .resizable()
                .frame(
                    width: 300,
                    height: 300
                )
                .clipped()
                .cornerRadius(150)
            if viewModel.isLoading {
                ProgressView("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .scaleEffect(1.3)
                Spacer()
            } else {
//                List($viewModel.medallas, id: \.typeMedalla) { $medalla in
//                    NavigationLink(
//                        destination: destinationView(for: medalla)
//                    ) {
//                        HStack {
//                            Text(medalla.nameComplet())
//                                .font(.title)
//                        }
//                    }
//                }
//                .listStyle(.insetGrouped)
            }
        }
        .ignoresSafeArea(edges: .top)
        .onDisappear { viewModel.cancelTask() }
        .onAppear { viewModel.loadMedallas() }
    }
}
