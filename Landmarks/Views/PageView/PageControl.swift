//
//  PageControl.swift
//  Landmarks
//
//  Created by Young on 2022/6/27.
//

import UIKit
import SwiftUI


struct PageControl: UIViewRepresentable {
    typealias UIViewType = UIPageControl
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(_:)), for: .valueChanged)
        return control
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        print(currentPage)
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(_ sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
}
