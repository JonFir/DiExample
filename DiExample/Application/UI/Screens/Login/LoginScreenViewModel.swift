import Combine

final class LoginScreenViewModel: ObservableObject {
    @Published var login = ""
    @Published var password = ""
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
//        objectWillChange.sink(receiveValue: {
//            print("asdklasjdklas")
//        }).store(in: &cancellables)
    }
    
    func auth() {
        login = "asdasdasdasd"
        password = "dddd"
    }
    
}
