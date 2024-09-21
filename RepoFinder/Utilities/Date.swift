//
//  Date.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation

func randomDateWithinLastThreeYears() -> Date? {
    let currentYear = Calendar.current.component(.year, from: Date())
    let randomYear = Int.random(in: (currentYear - 2) ... currentYear)
    let randomMonth = Int.random(in: 1 ... 12)

    var dateComponents = DateComponents()
    dateComponents.year = randomYear
    dateComponents.month = randomMonth

    let calendar = Calendar.current
    if let date = calendar.date(from: dateComponents),
       let range = calendar.range(of: .day, in: .month, for: date) {
        let randomDay = Int.random(in: range)
        dateComponents.day = randomDay

        if let randomDate = calendar.date(from: dateComponents) {
            return randomDate
        }
    }

    return nil
}
