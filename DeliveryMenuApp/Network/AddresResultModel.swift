//
//  AddresResultModel.swift
//  Restaurant
//
//  Created by Иван Пономарев on 28.01.2023.
//

import Foundation

struct AddresResultModel: Codable {
    let suggestions: [Suggestion]
}

// MARK: - Suggestion
struct Suggestion: Codable {
    let data: SuggestionData
}

// MARK: - DataClass
struct SuggestionData: Codable {
    let region: String?
    let city: String?
    let street_with_type: String?
    let house: String?
}

