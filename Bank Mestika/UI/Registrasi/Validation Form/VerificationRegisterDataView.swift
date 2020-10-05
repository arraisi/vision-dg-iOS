//
//  VerificationRegisterDataView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 01/10/20.
//

import SwiftUI

struct VerificationRegisterDataView: View {
    
    @State var image: Image? = nil
    
    @State var data: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            Color(hex: "#232175")
            
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                
            }
            
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                ScrollView {
                    VStack {
                        Text("PASTIKAN INFORMASI ANDA BENAR")
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
                
                VStack {
                    NavigationLink(destination: SuccessRegisterView()) {
                        Text("Submit Data")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 13))
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    }
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                    .padding(.horizontal, 100)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                }
                .background(Color.white)
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
            Group {
                LabelTextField(value: $data, label: "KTP", placeHolder: "KTP")
                    .padding(.top, 20)
                
                LabelTextField(value: $data, label: "No. Telepon", placeHolder: "No. Telepon")
                    .padding(.top, 10)
                
                LabelTextField(value: $data, label: "Email", placeHolder: "Email")
                    .padding(.top, 10)
                
                VStack {
                    HStack {
                        Text("Foto KTP")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.bold)
                        Spacer()
                        ZStack {
                            Image("ic_camera")
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 30)
                            VStack {
                                image?
                                    .resizable()
                                    .frame(maxWidth: 100, maxHeight: 50)
                                    .cornerRadius(10)
                            }
                            .frame(maxWidth: 100, minHeight: 50, maxHeight: 50)
                        }
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 50, maxHeight: 50)
                        .background(Color(hex: "#F5F5F5"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.2))
                        )
                    }
                    Divider()
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                VStack {
                    HStack {
                        Text("Selfie")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.bold)
                        Spacer()
                        ZStack {
                            Image("ic_camera")
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 30)
                            VStack {
                                image?
                                    .resizable()
                                    .frame(maxWidth: 100, maxHeight: 50)
                                    .cornerRadius(10)
                            }
                            .frame(maxWidth: 100, minHeight: 50, maxHeight: 50)
                        }
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 50, maxHeight: 50)
                        .background(Color(hex: "#F5F5F5"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.2))
                        )
                    }
                    Divider()
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                VStack {
                    HStack {
                        Text("Tanda Tangan")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.bold)
                        Spacer()
                        ZStack {
                            Image("ic_camera")
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 30)
                            VStack {
                                image?
                                    .resizable()
                                    .frame(maxWidth: 100, maxHeight: 50)
                                    .cornerRadius(10)
                            }
                            .frame(maxWidth: 100, minHeight: 50, maxHeight: 50)
                        }
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 50, maxHeight: 50)
                        .background(Color(hex: "#F5F5F5"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.2))
                        )
                    }
                    Divider()
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                VStack {
                    HStack {
                        Text("NPWP")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.bold)
                        Spacer()
                        ZStack {
                            Image("ic_camera")
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 30)
                            VStack {
                                image?
                                    .resizable()
                                    .frame(maxWidth: 100, maxHeight: 50)
                                    .cornerRadius(10)
                            }
                            .frame(maxWidth: 100, minHeight: 50, maxHeight: 50)
                        }
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 50, maxHeight: 50)
                        .background(Color(hex: "#F5F5F5"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.2))
                        )
                    }
                }
                .padding([.top, .bottom], 20)
                .padding(.horizontal, 20)
            }
            Spacer()
        }
        .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(15)
        .shadow(radius: 30)
    }
}

struct VerificationRegisterDataView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationRegisterDataView()
    }
}
