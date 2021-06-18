//
//  ExtensionTest.swift
//  JsonparserDemoAppTests
//
//  Created by RAVITEZ on 18/06/21.
//

import XCTest

extension XCTestCase {
  enum TestError: Error {
    case urlNotFound
  }
  
  func getData(fromJSON urlString: String) throws -> Data {
//    let bundle = Bundle(for: type(of: self))
    guard let url = URL(string: urlString) else {
      XCTFail("URL Eroor \(urlString)")
      throw TestError.urlNotFound
    }
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch {
      throw error
    }
  }
}
