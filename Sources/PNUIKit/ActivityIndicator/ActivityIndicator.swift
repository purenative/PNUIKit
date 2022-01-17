import UIKit
import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    
    @Binding
    public var animating: Bool
    
    public let style: UIActivityIndicatorView.Style
    
    public init(animating: Binding<Bool>,
                style: UIActivityIndicatorView.Style) {
        
        self._animating = animating
        self.style = style
    }
    
    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activiryIndicatorView = UIActivityIndicatorView(style: style)
        activiryIndicatorView.hidesWhenStopped = true
        return activiryIndicatorView
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if animating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
    
}
