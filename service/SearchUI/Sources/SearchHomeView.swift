import SwiftUI
import ComposableArchitecture
import SearchPresenter

public struct SearchHomeView: View {
    typealias ViewState = SearchHomeReducer.State.ViewState
    typealias ViewAction = SearchHomeReducer.Action.ViewAction

    init(store: StoreOf<SearchHomeReducer>) {
        self.store = store
        self.viewStore = ViewStore(
            store,
            observe: { $0.viewState },
            send: { .viewAction($0) }
        )
    }

    private let store: StoreOf<SearchHomeReducer>
    @ObservedObject private var viewStore: ViewStore<ViewState, ViewAction>

    public var body: some View {
        VStack {
            Text(viewStore.title)
            HStack {
                Button("Change ViewState Button") {
                    viewStore.send(.buttonTapped)
                }
                .padding(4)
                .border(.blue)
            }
            .padding(20)
        }
    }
}

#Preview {
    SearchHomeView(
        store: Store(
            initialState: SearchHomeReducer.State(),
            reducer: {
                SearchHomeReducer()
            }
        )
    )
}
