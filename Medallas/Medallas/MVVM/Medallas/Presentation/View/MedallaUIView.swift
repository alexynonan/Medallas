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
        static let scaleEffectValue = 1.3
        static let widthAndHeight: CGFloat = 100
        static let cornerRadius: CGFloat = 150
    }
    
    @ObservedObject var viewModel: MedallaViewModel
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack {
            Image(Constants.iconProfile)
                .resizable()
                .frame(
                    width: Constants.widthAndHeight,
                    height: Constants.widthAndHeight
                )
                .clipped()
                .cornerRadius(Constants.cornerRadius)
                .onTapGesture {
                    viewModel.registerTap()
                }
            if viewModel.isLoading {
                Spacer()
                ProgressView("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .scaleEffect(Constants.scaleEffectValue)
                Spacer()
            } else {
                List($viewModel.medallas, id: \.id) { $medalla in
                    MedallaRowView(medalla: $medalla)
                }
            }
        }
        .onDisappear { viewModel.cancelTask() }
        .onAppear { viewModel.loadMedallas() }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .background:
                print("⏸️ Entro a segundo plano")
                viewModel.saveDataToCoreData()
            case .active:
                print("▶️ App en primer plano")
                viewModel.loadMedallas()
            default:
                break
            }
        }
    }
}

struct MedallaRowView: View {
    private enum Constants {
        static let widthAndHeight: CGFloat = 50
        static let padding: CGFloat = 8
        static let spacing: CGFloat = 16
        static let radius: CGFloat = 3
    }
    @Binding var medalla: UIMedalla
    
    var body: some View {
        ZStack {
            HStack(spacing: Constants.spacing) {
                Image(medalla.showIconSuccessfulMedal())
                    .resizable()
                    .frame(width: Constants.widthAndHeight, height: Constants.widthAndHeight)
                    .clipShape(Circle())
                    .shadow(radius: Constants.radius)
                
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
            .padding(.vertical, Constants.padding)
            if medalla.mostrarAnimacionConfenti() {
                ConfettiUIView()
            }
        }
    }
}
