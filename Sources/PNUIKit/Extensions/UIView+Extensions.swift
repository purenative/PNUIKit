import UIKit

public extension UIView {
    
    func searchNearestView<View: UIView>(ofType viewType: View.Type) -> View? {
        if let matchingView = self.superview as? View {
            return matchingView
        } else {
            return superview?.searchNearestView(ofType: viewType)
        }
    }
    
}
