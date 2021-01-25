import SwiftUI

struct PasswordGeneratedView: View {
    let passwordViewModel: PasswordViewModel

    var body: some View {
        Button(
            action: buttonAction,
            label: {
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
                    Spacer()
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
            })
    }

    private func buttonAction() {
        UIPasteboard.general.string = passwordViewModel.password
        let feedback = UINotificationFeedbackGenerator()
        feedback.notificationOccurred(.success)
    }
}

struct PasswordGeneratedView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordGeneratedViewFactory.make(.init(password: "123-456-123-456-123-456"))
    }
}
