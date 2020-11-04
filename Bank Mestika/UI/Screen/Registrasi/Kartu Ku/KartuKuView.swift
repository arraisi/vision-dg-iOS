//
//  KartuKuView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 03/11/20.
//

import SwiftUI

struct KartuKuView: View {
    
    
    @State var data = [
        
        Card(id: 0, img: "kartuku_1", name: "KARTU 1", show: false),
        Card(id: 1, img: "kartuku_2", name: "KARTU 2", show: false),
        Card(id: 2, img: "kartuku_3", name: "KARTU 3", show: false),
        Card(id: 3, img: "kartuku_4", name: "KARTU 4", show: false),
        Card(id: 4, img: "kartuku_5", name: "KARTU 5", show: false),
        Card(id: 5, img: "kartuku_6", name: "KARTU 6", show: false),
        Card(id: 6, img: "kartuku_1", name: "KARTU 1", show: false),
        Card(id: 7, img: "kartuku_2", name: "KARTU 2", show: false),
        Card(id: 8, img: "kartuku_3", name: "KARTU 3", show: false),
        Card(id: 9, img: "kartuku_4", name: "KARTU 4", show: false),
        Card(id: 10, img: "kartuku_5", name: "KARTU 5", show: false),
        Card(id: 11, img: "kartuku_6", name: "KARTU 6", show: false)
        
    ]
    
    @State var kartu = [
        Kartu(id: 0, img: "kartuku_1", name: "KARTU 1", description: "KARTU 1", status: "", show: false),
        Kartu(id: 1, img: "kartuku_2", name: "KARTU 2", description: "KARTU 2", status: "", show: false),
        Kartu(id: 2, img: "kartuku_3", name: "KARTU 3", description: "KARTU 3", status: "", show: false),
        Kartu(id: 3, img: "kartuku_4", name: "KARTU 4", description: "KARTU 4", status: "", show: false),
//        Kartu(id: 4, img: "kartuku_5", name: "KARTU 5", description: "KARTU 4", status: "", show: false),
//        Kartu(id: 5, img: "kartuku_6", name: "KARTU 6", description: "KARTU 4", status: "", show: false),
    ]
    
    @State var item = [
        
        Card(id: 0, img: "atm_diamond", name: "KARTU 1", show: false),
        Card(id: 1, img: "atm_pearl", name: "KARTU 2", show: false),
        Card(id: 2, img: "atm_lamborgini", name: "KARTU 3", show: false)
        ]
    
    var body: some View{
        VStack{
            ScrollCarousellView(itemWidth: 236, itemHeight: 197, itemGapHeight: 15, data: $kartu) { (index) in
                print(index)
            }
        }
    }
}

struct KartuKuView_Previews: PreviewProvider {
    static var previews: some View {
        KartuKuView()
    }
}
