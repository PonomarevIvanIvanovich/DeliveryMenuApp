//
//  TimerNsObject.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 15.12.2023.
//

import Foundation

extension NSObject {
    func delaySearch(text: String, action: Selector, afterDelay: Double = 0.5) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(action, with: text, afterDelay: afterDelay)
    }
}
