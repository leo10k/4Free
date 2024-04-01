//
//  Extensions.swift
//  4free!
//
//  Created by Leonardo Macedo on 01/04/24.
//

import Foundation

extension String {
    func capitalizeFirstLettler() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
