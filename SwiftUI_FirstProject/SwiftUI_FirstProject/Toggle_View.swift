import SwiftUI

struct Toggle_View: View {
    @State var isOnToggle = false

    var body: some View {
        showToggle()
    }
    
    fileprivate func showToggle() -> some View {
        VStack {
            ZStack {
                HStack {
                    VStack {
                        Text("Visa")
                        Text("Cash")
                        Spacer().frame(height: 300)
                    }
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 10).fill(Color.yellow).offset(x: isOnToggle ? 100 : 0)
                Text("Smth on the screan").offset(x: isOnToggle ? 100 : 0)
            }
            Toggle(isOn: $isOnToggle, label: {
                Text("Показать текста")
            }).padding()
        }.animation(.spring(response: 0.5,
                            dampingFraction: 0.7,
                            blendDuration: 0.3))
    }
}

struct Toggle_View_Previews: PreviewProvider {
    static var previews: some View {
        Toggle_View()
    }
}
