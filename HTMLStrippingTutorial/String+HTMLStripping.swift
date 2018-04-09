//
//  String+HTMLStripping.swift
//  HTMLStrippingTutorial
//
//  Created by Jean Raphael on 09/04/2018.
//  Copyright © 2018 Jean Raphael. All rights reserved.
//

import Foundation

extension String {
    
    /// Remove the given HTML tag, based on the regular ecpression <\s*p[^>]*>(.*?)<\s*\/\s*p>
    /// You can try at [Regwx101](https://regex101.com)
    ///
    /// - Parameter tag: an HTML tag expressed like a, p.
    /// - Returns: a String.
    func strippingHTML(of tag: String) -> String {
        let regex = "<s*" + tag + "[^>]*>(.*?)<s*/s*" + tag + ">"
        
        return self.replacingOccurrences(of: regex, with: "", options: .regularExpression, range: nil)
    }
    
    func strippingHTML() -> String {
        let regex = "<[^>]+>"
        
        return self.replacingOccurrences(of: regex, with: "", options: .regularExpression, range: nil).trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
