//
//  InterviewRegistrationView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 30/09/20.
//

import SwiftUI
import ExytePopupView

struct InterviewRegistrationView: View {
    
    /*
     Boolean for Show Modal
     */
    @State var showingModal = false
    
    @State var pilihJam: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            Image("bg_splash")
                .resizable()
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                ScrollView {
                    VStack {
                        cardForm
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 35)
                    .padding(.bottom, 35)
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
            Image("ic_highfive")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 40)
                .padding(.horizontal, 20)
            
            Text("Pendaftaran Melalui Wawancara")
                .font(.title)
                .foregroundColor(Color(hex: "#232175"))
                .fontWeight(.bold)
                .padding([.top, .bottom], 20)
                .padding(.leading, 20)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Untuk menyelesaikan pendaftaran rekening, pihak Kami kemudian akan menghubungi Anda.")
                .font(.subheadline)
                .foregroundColor(Color(hex: "#707070"))
                .multilineTextAlignment(.leading)
                .padding(.top, 15)
                .padding(.horizontal, 20)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Silahkan terlebih dahulu memilih waktu untuk dihubungi.")
                .font(.subheadline)
                .foregroundColor(Color(hex: "#707070"))
                .multilineTextAlignment(.leading)
                .padding(.top, 25)
                .padding(.horizontal, 20)
                .fixedSize(horizontal: false, vertical: true)
            
            TextField("Pilih Jam", text: $pilihJam)
                .frame(height: 10)
                .font(.subheadline)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.bottom, 5)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            Text("Pastikan data Anda masih sama. Jika tidak maka silahkan mengisi kembali data pembuatan rekening baru")
                .font(.subheadline)
                .foregroundColor(Color(hex: "#707070"))
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
                .padding(.horizontal, 20)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack(alignment: .top) {
                Text("KTP")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "#707070"))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                
                TextField("Pilih Jam", text: $pilihJam)
                    .frame(height: 10)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
            }
            
            Button(action : {
                showingModal.toggle()
            }) {
                Text("Buat Janji")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            }
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.bottom, 5)
            
            Button(action : {}) {
                Text("Batalkan Permohonan")
                    .foregroundColor(Color(hex: "#707070"))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            }
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            Spacer()
        }
        .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 30)
    }
    
    /*
     Fuction for Create Bottom Floater (Modal)
     */
    func createBottomFloater() -> some View {
        VStack(alignment: .leading) {
            Image("Logo M")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            Text("Terimakasih telah memilih Bank Mestika")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 22))
                .foregroundColor(Color(hex: "#2334D0"))
                .padding(.bottom, 30)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Permohonan Pembukaan Rekening Anda sedang dalam proses persetujuan. Pihak kami akan menghubungi Anda untuk memverifikasi data.")
                .font(.caption)
                .foregroundColor(Color(hex: "#232175"))
                .padding(.bottom, 30)
            
            Button(action: {}) {
                Text("Kembali ke Halaman Utama")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            .padding(.bottom, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 60)
        .padding(.horizontal, 15)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct InterviewRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        InterviewRegistrationView()
    }
}
