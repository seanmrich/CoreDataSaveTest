import SwiftUI
import CoreData

struct ContentView: View {
    @State private var name = ""
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Item.entity(), sortDescriptors: [.byName]) var items: FetchedResults<Item>

    var body: some View {
        VStack {
            HStack {
                TextField("Name", text: $name)
                Button("New") {
                    let item = Item(context: moc)
                    item.name = name
                }
            }
            .padding()
            
            VStack {
                ForEach(items) { item in
                    Text(item.name ?? "No name")
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension NSSortDescriptor {
    static var byName: NSSortDescriptor {
        NSSortDescriptor(keyPath: \Item.name, ascending: true)
    }
}
