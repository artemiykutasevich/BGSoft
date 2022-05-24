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
            GeometryReader { proxy in
                ScrollView {
                    LazyHStack {
                        TabView {
                            ForEach(viewModel.newsline, id: \.id) { index in
                                NavigationLink(destination: DetailView(object: index)) {
                                    PresentationView(object: index)
                                }
                            }
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
