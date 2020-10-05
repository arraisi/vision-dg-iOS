//
//  Term&ConditionView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 30/09/20.
//

import SwiftUI

struct Term_ConditionView: View {
    
    @State var isChecked:Bool = false
    
    func toggle() { isChecked = !isChecked }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Color(hex: "#232175")
                    .frame(height: 300)
                Color(hex: "#F6F8FB")
            }
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                VStack {
                    Text("SYARAT DAN KETENTUAN")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    cardForm
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 35)
                .padding(.bottom, 35)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
    }
    
    var appbar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            }
            Spacer()
            logo
            Spacer()
        }
    }
    
    var logo: some View {
        HStack(alignment: .center, spacing: .none) {
            Image("Logo M")
                .resizable()
                .frame(width: 25, height: 25)
            Text("BANK MESTIKA")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
        }
    }
    
    var cardForm: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium sollicitudin ex. Nulla faucibus tellus sed est auctor volutpat. Integer sollicitudin, nisi quis luctus malesuada, quam tortor elementum ligula, ut interdum leo turpis id mi. Vivamus nec consequat nibh. Cras augue ligula, vulputate id est in, suscipit convallis ligula. Duis porta, lorem id pharetra rutrum, neque metus eleifend tellus, et interdum odio dui ut lorem. Nunc elementum erat magna, eget lobortis mi venenatis sit amet. Ut vitae dictum odio. Quisque convallis enim eros, non sagittis nunc pulvinar ac. In vel malesuada dui, vel posuere lacus. Donec tempus libero ac augue lacinia convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium sollicitudin ex. Nulla faucibus tellus sed est auctor volutpat. Integer sollicitudin, nisi quis luctus malesuada, quam tortor elementum ligula, ut interdum leo turpis id mi. Vivamus nec consequat nibh. Cras augue ligula, vulputate id est in, suscipit convallis ligula. Duis porta, lorem id pharetra rutrum, neque metus eleifend tellus, et interdum odio dui ut lorem. Nunc elementum erat magna, eget lobortis mi venenatis sit amet. Ut vitae dictum odio. Quisque convallis enim eros, non sagittis nunc pulvinar ac. In vel malesuada dui, vel posuere lacus. Donec tempus libero ac augue lacinia convallis.")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "#707070"))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
            }
            
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            Spacer()
            
            Button(action: toggle) {
                HStack(alignment: .top) {
                    Image(systemName: isChecked ? "checkmark.square": "square")
                    Text("* Saya Adalah Warga Negara Indonesia dan tidak memiliki kewajiban pajak di Negara lain")
                        .font(.caption)
                        .foregroundColor(Color(hex: "#707070"))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
            }
            
            Button(action: toggle) {
                HStack(alignment: .top) {
                    Image(systemName: isChecked ? "checkmark.square": "square")
                    Text("* Saya Adalah Warga Negara Indonesia dan tidak memiliki kewajiban pajak di Negara lain")
                        .font(.caption)
                        .foregroundColor(Color(hex: "#707070"))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
            }
            
            Button(action: toggle) {
                HStack(alignment: .top) {
                    Image(systemName: isChecked ? "checkmark.square": "square")
                    Text("* Saya Adalah Warga Negara Indonesia dan tidak memiliki kewajiban pajak di Negara lain")
                        .font(.caption)
                        .foregroundColor(Color(hex: "#707070"))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            
            NavigationLink(destination: VerificationRegisterDataView()) {
                Text("Berikutnya")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            }
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)

        }
        .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 30)
    }
}

struct Term_ConditionView_Previews: PreviewProvider {
    static var previews: some View {
        Term_ConditionView()
    }
}
