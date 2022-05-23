//
//  PresentationView.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 22.05.22.
//

import SwiftUI

struct PresentationView: View {
    let object: GalleryNewslineModel
    
    let height = UIScreen.main.bounds.height - 100
    let width = UIScreen.main.bounds.width - 80
    
    var body: some View {
        AsyncImage(url: URL(string: "http://dev.bgsoft.biz/task/\(object.id).jpg")) { phase in
            if let image = phase.image {
                ZStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .clipped()
                    VStack {
                        Spacer()
                        Text(object.userName)
                            .font(.title)
                            .padding()
                            .background(.white, in: RoundedRectangle(cornerRadius: 18))
                    }
                    .padding()
                    .frame(width: width, height: height)
                }
            } else if phase.error != nil {
                ZStack {
                    Text("Image upload error")
                        .foregroundColor(.red)
                        .frame(width: width, height: height)
                    VStack {
                        Spacer()
                        Text(object.userName)
                            .font(.title)
                            .foregroundColor(.red)
                            .padding()
                    }
                    .padding()
                    .frame(width: width, height: height)
                }
            } else {
                ProgressView()
                    .frame(width: width, height: height)
            }
        }
    }
}

struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView(
            object: GalleryNewslineModel(
                id: "dldl",
                photoURL: "http://dev.bgsoft.biz/task/CennImb4CZA.jpg",
                userName: "madam",
                userURL: ""))
    }
}
