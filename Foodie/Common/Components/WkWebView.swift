//
//  WkWebView.swift
//  Foodie
//
//  Created by Nurul Mustika on 04/12/24.
//

//import WebKit
//
//extension WKWebView {
//    /// Loads HTML content into the web view.
//    /// - Parameter html: The HTML string to render.
//    func loadHTMLContent(_ html: String) {
//        let fullHTML = """
//        <!DOCTYPE html>
//        <html>
//        <head>
//        <style>
//            body {
//                font-family: -apple-system, Helvetica, Arial, sans-serif;
//                font-size: 25px;
//                color: #000;
//                justify-content: center;
//            }
//        </style>
//        </head>
//        <body>
//        \(html)
//        </body>
//        </html>
//        """
//        self.loadHTMLString(fullHTML, baseURL: nil)
//    }
//}

import WebKit

extension WKWebView {
    /// - Parameters:
    ///   - html: The HTML string to render.
    ///   - font: The custom font to use. Defaults to the system font.
    ///   - fontSize: The font size in points. Defaults to 16.
    ///   - textColor: The text color. Defaults to black.
    func loadHTMLContent(
        _ html: String,
        font: String = "-apple-system",
        fontSize: CGFloat = 25,
        textColor: UIColor = .black
    ) {
        let colorHex = textColor.toHex() ?? "#000000"
        let fullHTML = """
        <!DOCTYPE html>
        <html>
        <head>
        <style>
            body {
                font-family: \(font);
                font-size: \(fontSize)px;
                color: \(colorHex);
                text-align: justify;
                margin: 0;
                padding: 0;
            }
        </style>
        </head>
        <body>
        \(html)
        </body>
        </html>
        """
        self.loadHTMLString(fullHTML, baseURL: nil)
    }
}

extension UIColor {
    /// Converts a UIColor to a hex string representation.
    func toHex() -> String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", r, g, b)
    }
}

