//
//  LabelView.swift
//  Foodie
//
//  Created by Nurul Mustika on 04/12/24.
//

import UIKit

extension UILabel {
    func setHTMLText(_ html: String) {
        if let data = html.data(using: .utf8) {
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
                self.attributedText = attributedString
            }
        }
    }
}
