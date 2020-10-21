//
//  RegisterView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 23/09/20.
//

import SwiftUI
import ExytePopupView
import SystemConfiguration

struct RegisterView: View {
    
    /*
     For Check Internet Connection
     */
    private let reachability = SCNetworkReachabilityCreateWithName(nil, "www.aple.com")
    
    @State var isActive : Bool = false
    @State var isActiveRoot : Bool = false
    @ObservedObject var assetsSliderVM = SliderAssetsSummaryViewModel()
    
    var registerData = RegistrasiModel()
    var loginData = LoginBindingModel()
    
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var user: FetchedResults<User>
    @State var isViewActivity: Bool = false
    
    /*
     Boolean for Show Modal & Alert
     */
    @State var showingModal = false
    @State var showAlert = false
    
    /*
     Variable for Image Carousel
     */
    @State var page = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#232175")
                
                VStack(alignment: .leading) {
                    header
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    
                    imageSlider
                    
                    footerBtn
                        .padding(.top, 20)
                        .padding(.bottom, 35)
                        .padding(.horizontal, 30)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                
                if self.showingModal {
                    ModalOverlay(tapAction: { withAnimation { self.showingModal = false } })
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .popup(isPresented: $showingModal, type: .floater(), position: .bottom, animation: Animation.spring(), closeOnTapOutside: true) {
                createBottomFloater()
            }
            .alert(isPresented: self.$showAlert) {
                Alert(title: Text("No Internet Connection"), message: Text("please enable WiFi or Cellular Data"), dismissButton: .default(Text("Ok")))
            }
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            print("ON APPEAR")
            
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(self.reachability!, &flags)
            
            //            if self.(with: flags) {
            //                self.showAlert = false
            //            } else {
            //                self.showAlert = true
            //            }
            
            assetsSliderVM.getSliderAssets()
            
            UINavigationBar.appearance().barTintColor = UIColor(Color(hex: "#232175"))
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        })
    }
    
    var header: some View {
        VStack(alignment: .leading) {
            Text("Welcome to")
                .fontWeight(.semibold)
                .font(.system(size: 14))
                .foregroundColor(.white)
            HStack(alignment: .center, spacing: .none) {
                Image("Logo M")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("BANK MESTIKA")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .bold()
            }.padding(.top, -5)
        }.padding(.top, 30)
    }
    
    var imageSlider: some View {
        GeometryReader{g in
            RegisterSliderView(page: self.$page, assets: self.assetsSliderVM.assets)
        }
    }
    
    var footerBtn: some View {
        VStack {
            Button(action : {
                showingModal.toggle()
            }) {
                Text("DAFTAR")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .padding(.bottom, 2)
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            
            NavigationLink(destination: FirstLoginView(rootIsActive: self.$isActive).environmentObject(loginData), isActive: self.$isActive) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .cornerRadius(12)
            
            //            NavigationLink(destination: PilihJenisATMView()) {
            //                Text("LOGIN")
            //                    .foregroundColor(.white)
            //                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            //                    .font(.system(size: 12))
            //                    .frame(maxWidth: .infinity, maxHeight: 40)
            //            }
            //            .cornerRadius(12)
        }
    }
    
    // MARK: -BOTTOM FLOATER FOR MESSAGE
    func createBottomFloater() -> some View {
        VStack(alignment: .leading) {
            Image("ic_bell")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 20)
            Text("Sebelum Memulai..!!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "#232175"))
                .padding(.bottom, 20)
            Text("Apakah Anda Merupakan Nasabah Bank Mestika?")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 22))
                .foregroundColor(Color(hex: "#232175"))
                .padding(.bottom, 30)
            
            NavigationLink(destination: RegisterProvisionView(rootIsActive: self.$isActiveRoot).environmentObject(registerData), isActive: self.$isActiveRoot) {
                Text("Tidak, Saya Bukan")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .padding(.bottom, 2)
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            
            NavigationLink(destination: RegisterRekeningCardView().environmentObject(registerData)) {
                Text("Ya, saya Nasabah Bank Mestika")
                    .foregroundColor(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .padding(.bottom, 30)
            .cornerRadius(12)
        }
        .frame(width: UIScreen.main.bounds.width - 60)
        .padding(.horizontal, 15)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
