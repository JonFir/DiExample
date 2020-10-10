import SwiftUI

struct SelectScreen: View {
    @State var hz = ""
    @ObservableObject var provider = S()
    let data = [
        Country(id: 0, label: "1"),
        Country(id: 1, label: "2"),
        Country(id: 2, label: "3"),
        Country(id: 3, label: "4"),
        Country(id: 4, label: "5"),
    ]
    var body: some View {
        List{
            Section {
                TextField("Поиск", text: $hz)
            }
            
            ForEach(data) { item in
                Text(item.label)
            }
        }.listStyle(InsetGroupedListStyle())
        .navigationTitle("Хз")
    }
}

struct SelectScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SelectScreen()
        }
    }
}


struct Country: Identifiable {
    let id: Int
    let label: String
}
