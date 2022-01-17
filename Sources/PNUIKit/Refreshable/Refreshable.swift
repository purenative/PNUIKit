import UIKit
import SwiftUI

struct RefreshableWrapper<Content: View>: UIViewRepresentable {
    
    private let refreshControl = UIRefreshControl()
    private let size: CGSize
    
    let content: () -> Content
    
    let onRefresh: () -> Void
    
    init(size: CGSize,
         @ViewBuilder content: @escaping () -> Content,
         onRefresh: @escaping () -> Void) {
        
        self.size = size
        self.content = content
        self.onRefresh = onRefresh
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onRefresh: onRefresh)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        
        refreshControl.addTarget(context.coordinator,
                                 action: #selector(Coordinator.handleRefresh(sended:)),
                                 for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
        let hostingView = UIHostingController(rootView: content()).view!
        hostingView.frame = CGRect(origin: .zero, size: size)
        hostingView.backgroundColor = .clear
        
        scrollView.addSubview(hostingView)
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator {
        
        private let onRefresh: () -> Void
        
        init(onRefresh: @escaping () -> Void) {
            self.onRefresh = onRefresh
        }
        
        @objc func handleRefresh(sended: UIRefreshControl) {
            onRefresh()
            sended.endRefreshing()
        }
        
    }
    
}

