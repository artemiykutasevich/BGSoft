//
//  DetailView.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 22.05.22.
//

import SwiftUI

struct DetailView: View {
    let object: GalleryNewslineModel
    
    var body: some View {
        URLWebView(urlToDisplay: URL(string: object.userURL)!)
            .navigationTitle(object.userName)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            object: GalleryNewslineModel(
                id: "CennImb4CZA",
                photoURL: "http://dev.bgsoft.biz/task/CennImb4CZA.jpg",
                userName: "",
                userURL: ""))
    }
}
