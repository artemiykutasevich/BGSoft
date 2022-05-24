//
//  PresentationView.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 22.05.22.
//

import SwiftUI

struct PresentationView: View {
    let object: GalleryNewslineModel
    
    var body: some View {
        GeometryReader { proxy in
            AsyncImage(url: URL(string: object.photoURL)!) { image in
                ZStack {
                    image
                        .resizable()
                        .scaledToFill()
                    VStack {
                        Spacer()
                        Text(object.userName)
                            .font(.title)
                            .padding()
                            .background(.white, in: Capsule())
                    }
                    .padding()
                }
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.5)
                    ProgressView()
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
            .clipped()
        }
    }
}

struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView(
            object: GalleryNewslineModel(
                id: "CennImb4CZA",
                photoURL: "http://dev.bgsoft.biz/task/CennImb4CZA.jpg",
                userName: "",
                userURL: ""))
    }
}
