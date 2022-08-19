//
//  PageViewController.swift
//  Landmarks
//
//  Created by Young on 2022/6/17.
//

import SwiftUI
import UIKit

struct PageViewController<Page : View>: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIPageViewController
    
    var pages: [Page]
    @Binding var currentPage: Int
    
    //协调器
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // SwiftUI calls this makeCoordinator() method before makeUIViewController(context:),
    // so that you have access to the coordinator object when configuring your view controller.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll, navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    
    /*
     您可以使用此协调器来实现常见的 Cocoa 模式，例如委托、数据源以及通过 target-action 响应用户事件。
     
     我们在协调器中初始化并存储自控制器, 因为系统会在你想更新视图之前 仅初始化他们一次
     */
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map{ UIHostingController.init(rootView: $0) }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController,
                                didFinishAnimating finished: Bool,
                                previousViewControllers: [UIViewController],
                                transitionCompleted completed: Bool) {
            print("scroll...")
            
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
