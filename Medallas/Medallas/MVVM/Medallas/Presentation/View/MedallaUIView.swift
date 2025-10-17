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
            if viewModel.isLoading {
                Spacer()
                ProgressView("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .scaleEffect(1.3)
                Spacer()
            } else {
                List($viewModel.medallas, id: \.id) { $medalla in
                    MedallaRowView(medalla: $medalla)
                }
            }
        }
        .onDisappear { viewModel.cancelTask() }
        .onAppear { viewModel.loadMedallas() }
    }
}

struct MedallaRowView: View {
    @Binding var medalla: UIMedalla
    
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                Image(medalla.showIconSuccessfulMedal())
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                
                VStack(alignment: .leading) {
                    Text(medalla.name)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("\(medalla.points)/100 puntos")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
                Text("\(medalla.level) Nv.")
                    .font(.headline)
            }
            .padding(.vertical, 8)
            if medalla.mostrarAnimacionConfenti() {
                ConfettiUIView()
            }
        }
    }
}
