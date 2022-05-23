//
//  URLWebView.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 23.05.22.
//

import SwiftUI
import WebKit

struct URLWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    var urlToDisplay: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: urlToDisplay))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
