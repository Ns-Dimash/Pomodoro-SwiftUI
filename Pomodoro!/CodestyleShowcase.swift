import SwiftUI

struct CodestyleShowcase: View {
    var body: some View {
        ZStack {
            main
            dimming
            bottomSheet
        }
        .edgesIgnoringSafeArea(.all)
    }

    var main: some View {
        Text("Save your first bookmark")
            .font(.largeTitle)
    }

    var dimming: some View {
        Color.black.opacity(0.2)
    }

    var bottomSheet: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
            VStack {
                bottomSheetHeader
                    .padding(.top, 16)
                Spacer()
                VStack(spacing: 16) {
                    CustomTextField(placeholder: "Bookmark title")
                        .withTitle(named: "Bookmark name")
                    CustomTextField(placeholder: "Bookmark link (URL)")
                        .withTitle(named: "Link")
                    CustomButton(text: "Save")
                }
            }
            .padding(16)
        }
        .frame(height: 362)
        .inBottomSheet()
    }

    var bottomSheetHeader: some View {
        HStack {
            Spacer()
            Image(systemName: "xmark")
        }
    }
}

struct CustomButton: View {
    let text: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.black)
                    .frame(height: 52)
                Text(text)
                    .foregroundColor(.white)
            }
        }
    }
}

struct CustomTextField: View {
    let placeholder: String

    var body: some View {
        TextField(placeholder, text: .constant(""))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        Color.gray.opacity(0.2)
                    )
            )
    }
}

fileprivate extension View {
    func withTitle(named name: String) -> some View {
        VStack {
            HStack {
                Text(name)
                Spacer()
            }
            self
        }
    }

    func inBottomSheet() -> some View {
        VStack {
            Spacer()
            self
        }
    }
}

struct CodestyleShowcase_Previews: PreviewProvider {
    static var previews: some View {
        CodestyleShowcase()
    }
}
