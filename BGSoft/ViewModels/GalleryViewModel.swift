//
//  GalleryViewModel.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 21.05.22.
//

import SwiftUI

class GalleryViewModel: ObservableObject {
    @Published var newsline = [GalleryNewslineModel]()
    
    var selectedItem = 0
    var tempNewsline = [GalleryNewslineModel]()
    
    let networkManager = NetworkManager.networkManager
    
    init() {
        networkManager.fetchData(completion: { response in
            switch response {
            case .success(let data):
                for item in data {
                    let element = GalleryNewslineModel(
                        id: item.key,
                        photoURL: "http://dev.bgsoft.biz/task/\(item.key).jpg",
                        userName: item.value.userName,
                        userURL: item.value.userURL)
                    self.tempNewsline.append(element)
                }
                self.tempNewsline = self.tempNewsline.sorted { $0.userName < $1.userName }
                self.newsline = self.tempNewsline
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func incrementItem() {
        print("left")
        selectedItem += 1
        if selectedItem == newsline.count - 1 {
            newsline.append(contentsOf: tempNewsline)
        }
    }
}
