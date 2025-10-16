//
//  AlbumUIView.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import SwiftUI

struct AlbumUIView: View {
    
    @ObservedObject var viewModel: AlbumViewModel
    
    var body: some View {
        Text(viewModel.getTitle())
    }
}
