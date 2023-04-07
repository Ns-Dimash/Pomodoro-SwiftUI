import SwiftUI

/*
  🧬 Evolution 🧬
 1. VStack
 2. ScrollView + VStack
 3. ScrollView + VStack + ForEach
 4. List
 5. List + ForEach
 6. List + Sections
 7. List + Sections + Nested ForEach

 */

// 1. VStack (10 view limit)
struct One: View {
    var body: some View {
        VStack {
            Group { // DRY - Don't Repeat Yourself
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
            }
            Group {
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
                FileView(file: .example)
            }
        }
    }
}

// 2. ScrollView + VStack
struct Two: View {
    var body: some View {
        ScrollView {
            One()
        }
    }
}

// 3. ScrollView + VStack + ForEach
struct Three: View {
    let files = Array(repeating: File.example, count: 30)

    var body: some View {
        ScrollView {
            VStack {
                ForEach(files) { file in
                    FileView(file: file)
                }
            }
        }
    }
}

// 4. List
struct Four: View {
    var body: some View {
        List { // => ScrollView + VStack
            FileView(file: .example)
            FileView(file: .example)
            FileView(file: .example)
            FileView(file: .example)
            FileView(file: .example)
            FileView(file: .example)
            FileView(file: .example)
            FileView(file: .example)
            FileView(file: .example)
            FileView(file: .example)
        }
    }
}

// 5. List + ForEach
struct Five: View {
    var body: some View {
        List {
            ForEach(0 ..< 30, id: \.self) { _ in
                FileView(file: .example)
            }
        }
    }
}

// 6. List + Section
struct Six: View {
    var body: some View {
        List {
            Section(header: Text("Personal files")) {
                ForEach(0 ..< 30, id: \.self) { _ in
                    FileView(file: .example)
                }
            }
        }
    }
}

// 7. List + Section + NestedForEach
struct Seven: View {
    let folders = [
        File.folderWithExamples,
        File.folderWithExamples,
        File.folderWithExamples,
        File.folderWithExamples
    ]

    var body: some View {
        List {
            ForEach(folders) { folder in
                Section(header: Text(folder.name)) {
                    ForEach(folder.children) { child in
                        FileView(file: child)
                    }
                }
            }
        }
    }
}

struct ListShowcase_Previews: PreviewProvider {
    static var previews: some View {
        Seven()
    }
}

struct File: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
    var size: String {
        "\(Int.random(in: 0 ... 1000))kB"
    }

    var children: [File] = []

    static let example = File(name: "file")
    
    static var folderWithExamples: File {
        File(name: "folder\(Int.random(in: 0 ... 100))",
             children: Array(repeating: File.example, count: Int.random(in: 1 ... 5)))
    }
    
}

struct FileView: View {
    let file: File

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(file.name)
                    .font(.system(size: 15, weight: .semibold))
                Text(file.size)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 16)
            Spacer()
        }
    }
}
