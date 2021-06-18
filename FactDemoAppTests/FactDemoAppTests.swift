//
//  FactDemoAppTests.swift
//  FactDemoAppTests
//
//  Created by RAVITEZ on 18/06/21.
//
@testable import FactDemoApp
import XCTest

class FactDemoAppTests: XCTestCase {
//    private var factViewModel : FactViewModel!
    var fact: Fact!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = try getData(fromJSON: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
        guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
        fact = try JSONDecoder().decode(Fact.self, from: properData)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        fact = nil;
        super.tearDown()
    }

    func testJSONMapping() {
        XCTAssertEqual(fact.title,"About Canada")
        XCTAssertEqual(fact.rows?.count, 14)
    }
    
    func testFirstFactJSONMapping() {
      let factItem = fact.rows?.first!
      XCTAssertEqual(factItem?.title, "Beavers")
      XCTAssertEqual(factItem?.description, "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony")
      XCTAssertEqual(factItem?.imageHref, "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")
//      XCTAssertNotNil(firstSong.previewUrl)
    }

}
