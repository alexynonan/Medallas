//
//  PerfilUIView.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

import SwiftUI

struct PerfilUIView: View {
    
    private enum Constants {
        static let iconProfile = "ic_profile"
    }
    
    @ObservedObject var viewModel: PerfilViewModel
    
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
                List($viewModel.funcionalitys, id: \.type) { $funcionality in
                    NavigationLink(
                        destination: destinationView(for: funcionality)
                    ) {
                        HStack {
                            Text(funcionality.nameComplet())
                                .font(.title)
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
        }
        .ignoresSafeArea(edges: .top)
        .onDisappear { viewModel.cancelTask() }
        .onAppear { viewModel.loadMedallas() }
    }
    @ViewBuilder
    private func destinationView(for funcionality: UIPerfilFuncionality) -> some View {
        switch funcionality.type {
        case 1:
            MedallaUIView(viewModel: viewModel.redirectionMedallaDetalle())
                .navigationTitle(funcionality.nameComplet())
        case 2:
            MisionesUIView(viewModel: viewModel.redirectionMisiones())
        case 3:
            RachasUIView(viewModel: viewModel.redirectionRachas())
        case 4:
            AlbumUIView(viewModel: viewModel.redirectionAlbum())
        default:
            Text("Detalle no disponible")
        }
    }
}
