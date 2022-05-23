//
//  GalleryView.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 21.05.22.
//

import SwiftUI

struct GalleryView: View {
    @StateObject private var viewModel = GalleryViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.newsline) { item in
                        NavigationLink(destination: DetailView(object: item)) {
                            PresentationView(object: item)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
