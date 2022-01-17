import SwiftUI

struct RefreshableViewModifier: ViewModifier {
    
    let onRefresh: () -> Void
    
    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content.refreshable {
                onRefresh()
            }
        } else {
            GeometryReader { geometry in
                RefreshableWrapper(size: geometry.size) {
                    content
                } onRefresh: {
                    onRefresh()
                }
            }
        }
    }
    
}
