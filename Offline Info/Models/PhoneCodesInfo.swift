//
//  PhoneCodesInfo.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 24.10.2022.
//

import Foundation

class PhoneCodesInfo {
    
    let sectionName: String
    let sectionObject: [String: String]
    var isOpened: Bool = false
    
    init(sectionName: String, sectionObject: [String: String], isOpened: Bool = false) {
        self.sectionName = sectionName
        self.sectionObject = sectionObject
        self.isOpened = isOpened
    }
    
}

extension PhoneCodesInfo {
    
    static func getCountriesList() -> [PhoneCodesInfo] {
        
        var countries: [PhoneCodesInfo] = []
        
        let sectionNames = DataManager.shared.letterEnumeration
        
        let aCountry = DataManager.shared.aCountries
        let bCountry = DataManager.shared.bCountries
        let cCountry = DataManager.shared.cCountries
        let dCountry = DataManager.shared.dCountries
        let eCountry = DataManager.shared.eCountries
        let fCountry = DataManager.shared.fCountries
        let gCountry = DataManager.shared.gCountries
        let hCountry = DataManager.shared.hCountries
        let iCountry = DataManager.shared.iCountries
        let jCountry = DataManager.shared.jCountries
        let kCountry = DataManager.shared.kCountries
        let lCountry = DataManager.shared.lCountries
        let mCountry = DataManager.shared.mCountries
        let nCountry = DataManager.shared.nCountries
        let oCountry = DataManager.shared.oCountries
        let pCountry = DataManager.shared.pCountries
        let qCountry = DataManager.shared.qCountries
        let rCountry = DataManager.shared.rCountries
        let sCountry = DataManager.shared.sCountries
        let tCountry = DataManager.shared.tCountries
        let uCountry = DataManager.shared.uCountries
        let vCountry = DataManager.shared.vCountries
        let yCountry = DataManager.shared.yCountries
        let zCountry = DataManager.shared.zCountries
        
        let allCountries = [
            aCountry,
            bCountry,
            cCountry,
            dCountry,
            eCountry,
            fCountry,
            gCountry,
            hCountry,
            iCountry,
            jCountry,
            kCountry,
            lCountry,
            mCountry,
            nCountry,
            oCountry,
            pCountry,
            qCountry,
            rCountry,
            sCountry,
            tCountry,
            uCountry,
            vCountry,
            yCountry,
            zCountry
        ]
        
        
        let countriesIndexes = sectionNames.count
        
        for index in 0..<countriesIndexes {
            let letterGroupedCountries = PhoneCodesInfo(sectionName: sectionNames[index], sectionObject: allCountries[index])
            
            countries.append(letterGroupedCountries)
        }
        return countries
    }
}



