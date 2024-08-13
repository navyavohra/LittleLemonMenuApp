//
//  MenuItem.swift
//  LittleLemonMenuApp
//
//  Created by Navya Vohra on 2024-08-14.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    let id: UUID
    let name: String
    let price: Double
}
