import SwiftUI

struct Alert_View: View {
    @State var isError = false
    
    var body: some View {
        showAlert()
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
}

struct Alert_View_Previews: PreviewProvider {
    static var previews: some View {
        Alert_View()
    }
}
