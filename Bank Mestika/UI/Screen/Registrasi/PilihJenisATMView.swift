//
//  PilihJenisATMView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 21/10/20.
//

import SwiftUI

struct PilihJenisATMView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            AppBar
                .padding(.top, 45)
                .padding(.horizontal, 30)
            
            ScrollView{
                
                Text("Pilih Desain Kartu ATM Anda")
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .padding(.top, 25)
                    .padding(.bottom, 15)
                
                TabView(selection: $selectedTab) {
                    ForEach(cardData) {
                        TabItemView(card: $0) {card in
                            print(card)
                        }
                    }
                }
                .shadow(color: Color(hex: "#2334D0").opacity(0.5), radius: 15, y: 4)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .padding(.bottom, 25)
                .onAppear(perform: {
                    setupAppearance()
                })
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                                    if value.translation.width < 0 {
                                        print("left")
                                        withAnimation{
                                            if selectedTab != cardData.count-1 {
                                                selectedTab += 1
                                            }
                                        }
                                        let card = cardData[selectedTab]
                                        print(card)
                                    }
                                    if value.translation.width > 0 {
                                        print("right")
                                        withAnimation{
                                            if selectedTab != 0 {
                                                selectedTab -= 1
                                            }
                                        }
                                        
                                        let card = cardData[selectedTab]
                                        print(card)
                                    }})
                )
                
                VStack {
                    HStack {
                        Text("Detail Limit Kartu ATM")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                        
                        Spacer()
                    }
                    .padding()
                    
                    ForEach(detailJenisATMData[selectedTab]) { item in
                        RowDetailATM(title: item.title, value: item.value)
                    }
                    
                    
                    NavigationLink(
                        destination: PilihDesainATMView(),
                        label: {
                            Text("PILIH KARTU ATM INI")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                                .frame(maxWidth: .infinity, maxHeight: 40)
                        })
                        .frame(height: 50)
                        .background(Color(hex: "#2334D0"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(.white))
                        .shadow(color: Color(hex: "#2334D0").opacity(0.5), radius: 15, y: 4))
                .padding(.leading, 25)
                .padding(.trailing, 25)
                .padding(.bottom)
            }
            
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
    }
    
    // MARK: - APP BAR
    var AppBar: some View {
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
    
    // MARK: - LOGO
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
    
    // MARK: - PAGES APPEARANCE
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        UIPageControl.appearance().pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.1968375428)
    }
    
}

// MARK: - ROW DETAIL ATM
struct RowDetailATM: View {
    var title: String = ""
    var value: String = ""
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    Text(title)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Text(value)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
            }
            
            
        }
    }
}

struct PilihJenisATMView_Previews: PreviewProvider {
    static var previews: some View {
        PilihJenisATMView()
    }
}
