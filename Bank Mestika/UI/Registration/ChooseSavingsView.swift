//
//  ChooseSavingsView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 25/09/20.
//

import SwiftUI
import ExytePopupView

struct ChooseSavingsView: View {
    
    /*
     Boolean for Show Modal
     */
    @State var showingModal = false
    
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
                        Image("Saving Image")
                            .padding(.bottom, 20)
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
            .shadow(radius: 30)
    }
}

struct ChooseSavingsView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSavingsView()
    }
}
