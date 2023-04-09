import SwiftUI

struct ContentView: View {
    @State var isError = false
    
    var body: some View {
//        Choose functions:
//        showAlert()
        showActionSheet()
    }
    
    fileprivate func showAlert() -> some View {
        Button(action: {
            self.isError = true
        }, label: {
            Text("Log in")
        }).alert(isPresented: $isError, content: {
            Alert(title: Text("Title"),
                  message: Text("Are you sure?"),
                  primaryButton: .destructive(Text("Ok"),
                                              action: {
                                                print("Zapka market")
                  }), secondaryButton: .cancel())
        })
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
        ContentView()
    }
}
