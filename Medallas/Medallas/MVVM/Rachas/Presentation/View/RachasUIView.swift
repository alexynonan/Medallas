//
//  RachasUIView.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import SwiftUI

struct RachasUIView: View {
    
    @ObservedObject var viewModel: RachasViewModel
    
    var body: some View {
        Text(viewModel.getTitle())
    }
}
