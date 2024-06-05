//
//  Utility.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 05/06/24.
//

import Foundation

/// A utility function to format a given number as a price string in USD.
///
/// - Parameter price: The price to format.
/// - Returns: A formatted price string in USD.
func formatPriceToUSD(_ price: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "USD"
    formatter.locale = Locale(identifier: "en_US")
    
    if let formattedPrice = formatter.string(from: NSNumber(value: price)) {
        return formattedPrice
    } else {
        return "$\(price)"
    }
}
