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
                    TabView {
                        ForEach(viewModel.newsline, id: \.id) { index in
                            GeometryReader { proxy2 in
                                let minX = proxy2.frame(in: .global).minX
                                
                                NavigationLink(destination: DetailView(object: index)) {
                                    PresentationView(object: index)
                                        .gesture(DragGesture(minimumDistance: 50.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                switch value.translation.width {
                                                case ...0: viewModel.incrementItem()
                                                case 0...: print("other swipe")
                                                default: print("")
                                                }
                                            }
                                        )
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 32))
                                .padding()
                                .scaleEffect(1.0 - abs(minX / proxy.size.width))
                                .rotation3DEffect(.degrees( minX / -5), axis: (x: 0, y: 1, z: 0))
                                .shadow(color: .black.opacity(0.5), radius: 8)
                                .blur(radius: minX / 40)
                            }
                        }
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .tabViewStyle(.page(indexDisplayMode: .never))
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
