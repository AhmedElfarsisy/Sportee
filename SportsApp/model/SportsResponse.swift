//
//  SportsResponse.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

// MARK: - SportsResponse
struct SportsResponse  {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport {
    let idSport, strSport: String
    let strFormat: StrFormat
    let strSportThumb, strSportThumbGreen: String
    let strSportDescription: String
}

enum StrFormat {
    case eventSport
    case teamvsTeam
}
