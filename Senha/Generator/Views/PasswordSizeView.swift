import SwiftUI

struct PasswordSizeView: View {
    @Binding var length: Int

    var body: some View {
        Group {
            HStack {
                ZStack {
                    Image(systemName: "square.fill")
                        .font(.title)
                        .foregroundColor(.purple)
                    Text("\(Int(length))")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Stepper("Length", value: $length, in: 5...50, step: 2)
            }
        }
    }
}

struct PasswordSizeView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordSizeViewFactory.make(.constant(25))
    }
}
