//
//  String+HTMLStripping.swift
//  HTMLStrippingTutorial
//
//  Created by Jean Raphael on 09/04/2018.
//  Copyright © 2018 Jean Raphael. All rights reserved.
//

import Foundation

extension String {
    
    ///  Remove the given HTML tags. Based on the regular ecpression <\s*p[^>]*>(.*?)<\s*\/\s*p>
    ///
    /// - Parameter tags: [String]
    /// - Returns: a String
    func strippingHTML(of tags: [String]) -> String {
        var result = self
        
        tags.forEach { tag in
            let regex = "<s*" + tag + "[^>]*>(.*?)<s*/s*" + tag + ">"

            result = result.replacingOccurrences(of: regex, with: "", options: .regularExpression, range: nil)
        }
        
        return result
    }
    
    /// Remove the given HTML tag. Based on the regular ecpression <\s*p[^>]*>(.*?)<\s*\/\s*p>
    ///
    /// You can try at [Regwx101](https://regex101.com)
    ///
    /// - Parameter tag: an HTML tag expressed like a, p.
    /// - Returns: a String.
    func strippingHTML(of tag: String) -> String {
        let regex = "<s*" + tag + "[^>]*>(.*?)<s*/s*" + tag + ">"
        
        return self.replacingOccurrences(of: regex, with: "", options: .regularExpression, range: nil)
    }
    
    /// Remove all the HTML tags leaving the content.  Based on the regular ecpression <[^>]+>
    ///
    /// You can try at [Regwx101](https://regex101.com)
    ///
    /// - Returns: a String.
    func strippingHTML() -> String {
        let regex = "<[^>]+>"
        
        return self.replacingOccurrences(of: regex, with: "", options: .regularExpression, range: nil).trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // MARK: - Private
    func strippingTag(of tag: String) -> String {
        let regex = "<s*" + tag + "[^>]*>(.*?)<s*/s*" + tag + ">"
        
        return self.replacingOccurrences(of: regex, with: "", options: .regularExpression, range: nil)
    }
}
