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
            HStack {
                Spacer()
                Image(Constants.iconProfile)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 250,
                        height: 300
                    )
                    .clipped()
                    .padding(.top, 50)
                    .cornerRadius(25)
                Spacer()
            }
            List($viewModel.medallas, id: \.typeMedalla) { $medalla in
                NavigationLink(
                    destination: destinationView(for: medalla)
                ) {
                    HStack {
                        Text(medalla.nameComplet())
                            .font(.title)
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        .ignoresSafeArea(edges: .top)
        .onAppear { viewModel.loadMedallas() }
    }
    @ViewBuilder
    private func destinationView(for medalla: UIMedalla) -> some View {
        switch medalla.typeMedalla {
        case 1:
            MedallaDetalleUIView(viewModel: viewModel.redirectionMedallaDetalle())
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
