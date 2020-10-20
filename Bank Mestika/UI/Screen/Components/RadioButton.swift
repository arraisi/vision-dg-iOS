import SwiftUI

enum SelectionAddress: String {
    case yes = "Ya, alamat sesuai"
    case no = "Tidak, alamat tidak sesuai"
}

//MARK:- Single Radio Button Field
struct RadioButton: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View {
        VStack {
            radioMajority
            radioMinority
        }
    }
    
    var radioMajority: some View {
        RadioButton(
            id: SelectionAddress.yes.rawValue,
            label: SelectionAddress.yes.rawValue,
            isMarked: selectedId == SelectionAddress.yes.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioMinority: some View {
        RadioButton(
            id: SelectionAddress.no.rawValue,
            label: SelectionAddress.no.rawValue,
            isMarked: selectedId == SelectionAddress.no.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
