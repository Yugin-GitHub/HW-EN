//
//  RandomNumberModel.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 19.12.24.
//

import Foundation

struct RandomNumberGenerator {
    func generateRandomNumber(min: Int, max: Int) -> Int {
        return Int.random(in: min...max)
    }
}

