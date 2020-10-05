//
//  ChooseSavingsView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 25/09/20.
//

import SwiftUI
import ExytePopupView

struct ChooseSavingsView: View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    @State var op : CGFloat = 0
    
    /*
     Boolean for Show Modal
     */
    @State var showingModal = false
    
    @State var data = [
        JenisTabungan(
            id: 1,
            namaTabungan: "Nama Tabungan 1",
            kartu: "Saving Image",
            show: false
        ),
        JenisTabungan(
            id: 2,
            namaTabungan: "Nama Tabungan 2",
            kartu: "Saving Image",
            show: false
        )
    ]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Color(hex: "#F6F8FB")
                    .frame(height: 400)
                Color(hex: "#232175")
            }
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                    VStack(alignment: .center) {
                        Text("Pilih Jenis Tabungan Anda")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(hex: "#232175"))
                            .padding(.horizontal, 15)
                        
                        HStack(spacing: 15){
                            ForEach(data) { i in
                                JenisTabunganItem(data: i)
                                    .offset(x: self.x)
                                    .highPriorityGesture(
                                        DragGesture()
                                            .onChanged({ (value) in
                                                if value.translation.width > 0 { self.x = value.location.x
                                                } else {
                                                    self.x = value.location.x - self.screen
                                                }
                                            })
                                            .onEnded({ (value) in if
                                                value.translation.width > 0 {
                                                if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0{
                                                    
                                                    
                                                    self.count -= 1
                                                    self.updateHeight(value: Int(self.count))
                                                    self.x = -((self.screen + 15) * self.count)
                                                }
                                                else {
                                                    
                                                    self.x = -((self.screen + 15) * self.count)
                                                }
                                            }
                                            else {
                                                if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1){
                                                    
                                                    self.count += 1
                                                    self.updateHeight(value: Int(self.count))
                                                    self.x = -((self.screen + 15) * self.count)
                                                }
                                                else {
                                                    
                                                    self.x = -((self.screen + 15) * self.count)
                                                }
                                            }
                                            })
                                    )
                            }
                        }
                        .offset(x: self.op)
                        .animation(.spring())
                        .onAppear {
                            
                            self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                            
                            self.data[0].show = true
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Deposit Tabungan")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(hex: "#3756DF"))
                                .padding(.top, 10)
                                .padding(.horizontal, 15)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Keunggulan Tabungan :")
                                .font(.footnote)
                                .padding(.top, 10)
                                .padding(.horizontal, 15)
                                .foregroundColor(Color(hex: "#5A6876"))
                            
                            HStack(alignment: .top) {
                                Text("01")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")
                                    .font(.caption)
                                    .foregroundColor(Color(hex: "#5A6876"))
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                            HStack(alignment: .top) {
                                Text("02")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")
                                    .font(.caption)
                                    .foregroundColor(Color(hex: "#5A6876"))
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                            HStack(alignment: .top) {
                                Text("03")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")
                                    .font(.caption)
                                    .foregroundColor(Color(hex: "#5A6876"))
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                            HStack(alignment: .top) {
                                Text("04")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")
                                    .font(.caption)
                                    .foregroundColor(Color(hex: "#5A6876"))
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                            HStack(alignment: .top) {
                                Text("05")
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")
                                    .font(.caption)
                                    .foregroundColor(Color(hex: "#5A6876"))
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                            Button(action: {
                                showingModal.toggle()
                            }) {
                                Text("Pilih Tabungan ini")
                                    .foregroundColor(.white)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 13))
                                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                            }
                            .background(Color(hex: "#2334D0"))
                            .cornerRadius(12)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 30)
                    }
                    .padding(.top, 35)
                }
            }
            
            if self.showingModal {
                ModalOverlay(tapAction: { withAnimation { self.showingModal = false } })
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
        .popup(isPresented: $showingModal, type: .floater(), position: .bottom, animation: Animation.spring(), closeOnTapOutside: true) {
            createBottomFloater()
        }
    }
    
    var appbar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color(hex: "#232175"))
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
                .foregroundColor(Color(hex: "#232175"))
                .font(.system(size: 20))
                .bold()
        }
    }
    
    /*
     Fuction for Create Bottom Floater (Modal)
     */
    func createBottomFloater() -> some View {
        SavingSelectionModalView()
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 100)
            .background(Color(.white))
            .cornerRadius(50)
            .shadow(radius: 60)
    }
    
    func updateHeight(value : Int) {
        for i in 0..<data.count {
            data[i].show = false
        }
        
        data[value].show = true
    }
}

struct JenisTabunganItem: View {
    var data: JenisTabungan
    
    var body: some View {
        Image(data.kartu)
            .padding(.bottom, 20)
            .frame(width: UIScreen.main.bounds.width - 30)
    }
}

struct ChooseSavingsView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSavingsView()
    }
}
