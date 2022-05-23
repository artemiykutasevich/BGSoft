//
//  GalleryViewModel.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 21.05.22.
//

import SwiftUI

class GalleryViewModel: ObservableObject {
    @Published var newsline = [GalleryNewslineModel]()
    
    let networkManager = NetworkManager.networkManager
    
    init() {
        networkManager.fetchData(completion: { response in
            switch response {
            case .success(let data):
                for item in data {
                    let element = GalleryNewslineModel(
                        id: item.key,
                        photoURL: item.value.photoURL,
                        userName: item.value.userName,
                        userURL: item.value.userURL)
                    self.newsline.append(element)
                }
                self.newsline = self.newsline.sorted { $0.userName < $1.userName }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
