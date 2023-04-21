import SwiftUI

struct GridShowcase: View {
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
    ]

    var body: some View {
        properHGrid
    }

    var straightforwardVGrid: some View {
        VStack {
            HStack {
                box
                box
            }
            HStack {
                box
                box
            }
            HStack {
                box
                box
            }
        }
    }

    var properVGrid: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            box
            box
            box
            box
            box
            box
            box
            box
            box
            box
        }
    }

    var straightforwardHGrid: some View {
        HStack {
            VStack {
                box
                box
            }
            VStack {
                box
                box
            }
            VStack {
                box
                box
            }
        }
    }

    let rows = [
        //        GridItem(.fixed(300)),
//        GridItem(.adaptive(minimum: 5)),
        GridItem(.flexible()),
        GridItem(.flexible()),
//        GridItem(.flexible())
    ]

    var properHGrid: some View {
        LazyHGrid(rows: rows, spacing: 20) {
            box
            box
            box
            box
            box
            box
        }
    }

    var box: some View {
        Rectangle()
            .fill(Color.red)
            .frame(height: 120)
    }
}

struct GridShowcase_Previews: PreviewProvider {
    static var previews: some View {
        GridShowcase()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
