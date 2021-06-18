//
//  FactsResponse.swift
//  JsonparserDemoApp
//
//  Created by RAVITEZ on 17/06/21.
//

import Foundation
struct Fact:Codable {
    let title: String?
    let rows: [FactRows]?
}
struct FactRows:Codable {
    var title: String?
    var description: String?
    var imageHref: String?
}
