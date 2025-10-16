//
//  MisionesUIView.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import SwiftUI

struct MisionesUIView: View {
    
    @ObservedObject var viewModel: MisionesViewModel
    
    var body: some View {
        Text(viewModel.getTitle())
    }
}
