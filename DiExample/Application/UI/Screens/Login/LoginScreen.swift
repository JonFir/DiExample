import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel = LoginScreenViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                TextField("Логин", text: $viewModel.login)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
                TextField("Пароль", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
                Button("Войти", action: viewModel.auth)
                    .padding(.bottom, 20)
                Text("")
            }.padding()
            Spacer()
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
