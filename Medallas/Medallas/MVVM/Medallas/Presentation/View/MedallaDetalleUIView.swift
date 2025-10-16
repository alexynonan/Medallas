//
//  MedallaDetalleUIView.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

import SwiftUI

struct MedallaDetalleUIView: View {
    
    @ObservedObject var viewModel: MedallaDetalleViewModel
    
    var body: some View {
        Text(viewModel.getTitle())
    }
}
