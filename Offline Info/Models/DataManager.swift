//
//  DataManager.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 25.10.2022.
//

import Foundation


class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    let letterEnumeration: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "Y", "Z"]
    
    let aCountries: [String: String] = ["Afghanistan": "+93",
                                        "Albania": "+355",
                                        "Algeria": "+213",
                                        "American Samoa": "+684",
                                        "Andorra": "+376",
                                        "Angola": "+244",
                                        "Anguilla": "+1-264",
                                        "Antarctica": "+672",
                                        "Antigua": "+1-268",
                                        "Argentina": "+54",
                                        "Armenia": "+374",
                                        "Aruba": "+297",
                                        "Ascension": "+247",
                                        "Australia": "+61",
                                        "Australian External Territories": "+672",
                                        "Austria": "+43",
                                        "Azerbaijan": "+994"]
    
    let bCountries: [String: String] = ["Bahamas": "+1-242",
                                        "Bahrain": "+973",
                                        "Bangladesh": "+880",
                                        "Barbados": "+1-246",
                                        "Belarus": "+375",
                                        "Belgium": "+32",
                                        "Belize": "+501",
                                        "Benin": "+229",
                                        "Bermuda": "+1-441*",
                                        "Bhutan": "+975",
                                        "Bolivia": "+591",
                                        "Bosnia & Herzegovina": "+387",
                                        "Botswana": "+267",
                                        "Brazil": "+55",
                                        "British Virgin Islands": "+1-284*",
                                        "Brunei Darussalam": "+673*",
                                        "Bulgaria": "+359",
                                        "Burkina Faso": "+226",
                                        "Burundi": "+257"]
    
    let cCountries: [String: String] = ["Cambodia": "+855",
                                        "Cameroon": "+237",
                                        "Canada": "+1",
                                        "Cape Verde Islands": "+238",
                                        "Cayman Islands": "+1-345*",
                                        "Central African Republic": "+236",
                                        "Chad": "+235",
                                        "Chatham Islands (New Zealand)": "+64",
                                        "Chile": "+56",
                                        "China": "+86",
                                        "Christmas Island": "+61",
                                        "Colombia": "+57",
                                        "Comoros": "+269",
                                        "Congo": "+243",
                                        "Cook Islands": "+682",
                                        "Costa Rica": "+506",
                                        "Cote d'Ivoire": "+225",
                                        "Croatia": "+385",
                                        "Cuba": "+53",
                                        "Cyprus": "+357",
                                        "Czech Republic": "+420"]
    
    let dCountries: [String: String] = ["Denmark": "+45",
                                        "Diego Garcia": "+246",
                                        "Djibouti": "+253",
                                        "Dominica": "+1-767*",
                                        "Dominican Republic": "+1-809*"]
    
    let eCountries: [String: String] = ["East Timor": "+670",
                                        "Easter Island": "+56",
                                        "Ecuador": "+593",
                                        "Egypt": "+20",
                                        "El Salvador": "+503",
                                        "Equatorial Guinea": "+240",
                                        "Eritrea": "+291",
                                        "Estonia": "+372",
                                        "Ethiopia": "+251"]
    
    let fCountries: [String: String] = ["Falkland Islands": "+500",
                                        "Faroe Islands": "+298",
                                        "Fiji Islands": "+679",
                                        "Finland": "+358",
                                        "France": "+33",
                                        "French Antilles": "+596",
                                        "French Guiana": "+594",
                                        "French Polynesia": "+689"]
    
    let gCountries: [String: String] = ["Gabonese Republic": "+241",
                                        "Gambia": "+220",
                                        "Georgia": "+995",
                                        "Germany": "+49",
                                        "Ghana": "+233",
                                        "Gibraltar": "+350",
                                        "Greece": "+30",
                                        "Greenland": "+299",
                                        "Grenada": "+1-473",
                                        "Guadeloupe": "+590",
                                        "Guam": "+1-671*",
                                        "Guatemala": "+502",
                                        "Guinea Bissau": "+245",
                                        "Guinea": "+224",
                                        "Guyana": "+592"]
    
    let hCountries: [String: String] = ["Haiti": "+509",
                                        "Honduras": "+504",
                                        "Hong Kong":"+852",
                                        "Hungary":"+36"]
    
    let iCountries: [String: String] = ["Iceland":"+354",
                                        "India":"+91",
                                        "Indonesia":"+62",
                                        "Iran":"+98",
                                        "Iraq":"+964",
                                        "Ireland":"+353",
                                        "Israel":"+972",
                                        "Italy":"+39"]
    
    let jCountries: [String: String] = ["Jamaica":"+1-876*",
                                        "Japan":"+81",
                                        "Jordan":"+962"]
    
    let kCountries: [String: String] = ["Kazakhstan":"+7",
                                        "Kenya":"+254",
                                        "Kiribati":"+686",
                                        "Korea (North)":"+850",
                                        "Korea (South)":"+82",
                                        "Kuwait":"+965",
                                        "Kyrgyz Republic":"+996"]
    
    let lCountries: [String: String] = ["Laos":"+856",
                                        "Latvia":"+371",
                                        "Lebanon":"+961",
                                        "Lesotho":"+266",
                                        "Liberia":"+231",
                                        "Libya":"+218",
                                        "Liechtenstein":"+423",
                                        "Lithuania":"+370",
                                        "Luxembourg":"+352"]
    
    let mCountries: [String: String] = ["Macao":"+853",
                                        "Macedonia":"+389",
                                        "Madagascar":"+261",
                                        "Malawi":"+265",
                                        "Malaysia":"+60",
                                        "Maldives":"+960",
                                        "Mali Republic":"+223",
                                        "Malta":"+356",
                                        "Marshall Islands":"+692",
                                        "Martinique":"+596",
                                        "Mauritania":"+222",
                                        "Mauritius":"+230",
                                        "Mayotte Island":"+269",
                                        "Mexico":"+52",
                                        "Micronesia":"+691",
                                        "Midway Island":"+1-808*",
                                        "Moldova":"+373",
                                        "Monaco":"+377",
                                        "Mongolia":"+976",
                                        "Montserrat":"+1-664*",
                                        "Morocco":"+212",
                                        "Mozambique":"+258",
                                        "Myanmar":"+95"]
    
    let nCountries: [String: String] = ["Namibia":"+264",
                                        "Nauru":"+674",
                                        "Nepal":"+977",
                                        "Netherlands":"+31",
                                        "Netherlands Antilles": "+599",
                                        "Nevis": "+1-869*",
                                        "New Caledonia": "+687",
                                        "New Zealand": "+64",
                                        "Nicaragua": "+505",
                                        "Niger": "+227",
                                        "Nigeria": "+234",
                                        "Niue": "+683",
                                        "Norfolk Island": "+672",
                                        "Northern Marine Islands": "+1-670*",
                                        "Norway": "+47"]
    
    let oCountries: [String: String] = ["Oman": "+968"]
    
    let pCountries: [String: String] = ["Pakistan": "+92",
                                        "Palau": "+680",
                                        "Panama": "+507",
                                        "Papua New Guinea": "+675",
                                        "Paraguay": "+595",
                                        "Peru": "+51",
                                        "Philippines": "+63",
                                        "Poland": "+48",
                                        "Portugal": "+351",
                                        "Puerto Rico": "+1-787"]
    
    let qCountries: [String: String] = ["Qatar": "+974"]
    
    let rCountries: [String: String] = ["Reunion Island": "+262",
                                        "Romania": "+40",
                                        "Russia": "+7",
                                        "Rwanda": "+250"]
    
    let sCountries: [String: String] = ["St. Helena": "+290",
                                        "St. Kitts/Nevis": "+1-869*",
                                        "St Lucia": " +1-758*",
                                        "St. Pierre & Miquelon": "+508",
                                        "St. Vincent & Grenadines": "+1-784*",
                                        "San Marino": "+378",
                                        "Sao Tomo and Principe": "+239",
                                        "Saudi Arabia": "+966",
                                        "Senegal": "+221",
                                        "Serbia & Montenegro": "+381",
                                        "Seychelles Republic": "+248",
                                        "Sierra Leone": "+232",
                                        "Singapore": "+65",
                                        "Slovak Republic": "+421",
                                        "Slovenia": "+386",
                                        "Solomon Islands": "+677",
                                        "Somalia": "+252",
                                        "South Africa": "+27",
                                        "Spain": "+34",
                                        "Sri Lanka": "+94",
                                        "Sudan": "+249",
                                        "Suriname": "+597",
                                        "Swaziland": "+268",
                                        "Sweden": "+46",
                                        "Switzerland": "+41",
                                        "Syria": "+963"]
    
    let tCountries: [String: String] = ["Taiwan": "+886",
                                        "Tajikistan": "+992",
                                        "Tanzania": "+255",
                                        "Thailand": "+66",
                                        "Togolese Republic": "+228",
                                        "Tokelau": "+690",
                                        "Tonga Islands": "+676",
                                        "Trinidad & Tobago": "+1-868",
                                        "Tunisia": "+216",
                                        "Turkey": "+90",
                                        "Turkmenistan": "+993",
                                        "Turks & Caicos Islands": "+1-649",
                                        "Tuvalu": "+688"]
    
    let uCountries: [String: String] = ["Uganda": "+256",
                                        "Ukraine": "+380",
                                        "United Arab Emirates": "+971",
                                        "United Kingdom": "+44",
                                        "USA": "+1",
                                        "US Virgin Islands": "+1-340*",
                                        "Uruguay": "+598",
                                        "Uzbekistan": "+998"]
    
    let vCountries: [String: String] = ["Vanuatu": "+678",
                                        "Vietnam": "+84",
                                        "Venezuela": "+58"]
    
    let yCountries: [String: String] = ["Yemen": "+998"]
    
    let zCountries: [String: String] = ["Zambia": "+260",
                                        "Zimbabwe": "+263"]
    
}

