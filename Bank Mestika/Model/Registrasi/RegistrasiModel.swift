//
//  RegistrasiModel.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 06/10/20.
//
import Combine
import SwiftUI

class RegistrasiModel: ObservableObject {
    @Published var noTelepon = ""
    @Published var jenisTabungan = ""
    @Published var nik = ""
    @Published var email = ""
    @Published var tujuanPembukaan = ""
    @Published var sumberDana = ""
    @Published var perkiraanPenarikan = ""
    @Published var besarPerkiraanPenarikan = ""
    @Published var perkiraanSetoran = ""
    @Published var pekerjaan = ""
    @Published var besarPerkiraanSetoran = ""
    @Published var sumberPenyandangDana = ""
    @Published var sumberPendapatanLainnya = ""
    @Published var namaPerusahaan = ""
    @Published var alamatPerusahaan = ""
    @Published var alamatKeluarga = ""
    @Published var kodePosKeluarga = ""
    @Published var kecamatanKeluarga = ""
    @Published var kelurahanKeluarga = ""
    @Published var kodePos = ""
    @Published var kecamatan = ""
    @Published var kelurahan = ""
    @Published var rtrw = ""
    @Published var noTeleponPerusahaan = ""
    @Published var penghasilanKotor = ""
    @Published var password = ""
    @Published var pin = ""
    @Published var fotoKTP: Image = Image("")
    @Published var fotoSelfie: Image = Image("")
    @Published var fotoTandaTangan: Image = Image("")
    @Published var fotoNPWP: Image = Image("")
    @Published var hasNoNpwp: Bool = false
}
