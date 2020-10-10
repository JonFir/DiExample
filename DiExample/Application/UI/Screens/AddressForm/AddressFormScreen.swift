import SwiftUI

struct AddressFormScreen: View {
    @State var country = ""
    @State var city = ""
    @State var house = ""
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink("Страна", destination: SelectScreen())
                    NavigationLink("Город", destination: SelectScreen())
                    TextField("Дом", text: $house)
                }
                Section {
                    Button("Сохранить", action: {})
                }
            }
            .navigationTitle("Адрес")
        }
    }
}

struct AddressFormScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddressFormScreen()
    }
}
