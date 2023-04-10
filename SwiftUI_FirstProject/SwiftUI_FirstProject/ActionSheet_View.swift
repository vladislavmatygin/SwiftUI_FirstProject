import SwiftUI

struct ActionSheet_View: View {
    @State var isError = false
    
    var body: some View {
        showActionSheet()
    }
    
    fileprivate func showActionSheet() -> some View {
        Button(action: {
            self.isError = true
        }, label: {
            Text("Log out")
        }).actionSheet(isPresented: $isError, content: {
            ActionSheet(title: Text("Loading"),
                        message: Text("Do you want to load this photo?"),
                        buttons: [.destructive(Text("Yes"), action: {
                            // func for loading
                        }), .cancel()])
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheet_View()
    }
}
