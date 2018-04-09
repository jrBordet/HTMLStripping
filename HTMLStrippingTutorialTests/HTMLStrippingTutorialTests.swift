//
//  HTMLStrippingTutorialTests.swift
//  HTMLStrippingTutorialTests
//
//  Created by Jean Raphael on 09/04/2018.
//  Copyright © 2018 Jean Raphael. All rights reserved.
//

import XCTest
@testable import HTMLStrippingTutorial

class HTMLStrippingTutorialTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_stripping_iframe() {
        let html = "<iframe src=\"https://www.youtube.com/embed/7PTkwZ1p0DI\" width=\"560\" height=\"315\" frameborder=\"0\"></iframe>"
        
        let result = html.strippingHTML(of: "iframe")
        
        let expected = ""
        
        XCTAssertEqual(result, expected)
    }
    
    func test_stripping_paragraph() {
        let html = "<p style:\"background-color:black;\">This is a paragraph</p><iframe src=\"https://www.youtube.com/embed/7PTkwZ1p0DI\" width=\"560\" height=\"315\" frameborder=\"0\"></iframe>"
        
        let result = html.strippingHTML(of: "p")
        
        let expected = "<iframe src=\"https://www.youtube.com/embed/7PTkwZ1p0DI\" width=\"560\" height=\"315\" frameborder=\"0\"></iframe>"
        
        XCTAssertEqual(result, expected)
    }
    
    func test_stripping_all() {
        let html = "<!DOCTYPE html> <html> <body> <h1>My First Heading</h1> <p>My first paragraph.</p> </body> </html>"
        
        let result = html.strippingHTML()
        
        XCTAssertEqual(result, "My First Heading My first paragraph.")
    }
    
}
