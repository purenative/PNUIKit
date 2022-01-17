import SwiftUI

public extension View {
    
    func withRefreshControl(onRefresh: @escaping () -> Void) -> some View {
        modifier(RefreshableViewModifier(onRefresh: onRefresh))
    }
    
}
