import SwiftUI

struct PasswordGeneratedView: View {
    let passwordViewModel: PasswordViewModel

    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "square.fill")
                    .font(.title)
                    .foregroundColor(.red)
                Text("✽")
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            Text(passwordViewModel.password)
                .font(.title)
                .fontWeight(.light)
            Spacer()
            Image(systemName: "doc.on.doc")
                .foregroundColor(.gray)
        }
        .padding(.vertical)
        .onTapGesture {
            UIPasteboard.general.string = passwordViewModel.password
        }
    }
}

struct PasswordGeneratedView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordGeneratedViewFactory.make(.init(password: "123-456"))
    }
}
