//
//  DayTests.swift
//  MensSanaTests
//
//  Created by Otávio Zabaleta on 29/03/2023.
//

import XCTest
import SwiftUI
@testable import MensSana

final class DayTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScore() throws {
        // Given:
        let greatDay = Day([.joy, .fun, .calmness, .happiness, .excitement])
        let greatDay2 = Day([.joy, .fun, .calmness, .happiness, .excitement, .sadness])
        let goodDay = Day([.joy, .calmness, .happiness, .fun, .helplessness])
        let goodDay2 = Day([.joy, .calmness, .happiness, .fun, .helplessness, .anger])
        let mehDay = Day([.joy, .anger, .calmness])
        let mehDay2 = Day([.joy, .anger, .helplessness])
        let badDay = Day([.anger, .helplessness, .sadness, .awkwardness, .fun])
        let badDay2 = Day([.anger, .helplessness, .sadness, .awkwardness, .fun, .joy,])
        let horribleDay = Day([.anger, .helplessness, .sadness, .awkwardness, .fear])
        let horribleDay2 = Day([.anger, .helplessness, .sadness, .awkwardness, .fear, .happiness])
        
        // Then:
        XCTAssertEqual(greatDay.grade, .exceptional)
        XCTAssertEqual(greatDay2.grade, .exceptional)
        XCTAssertEqual(goodDay.grade, .fine)
        XCTAssertEqual(goodDay2.grade, .fine)
        XCTAssertEqual(mehDay.grade, .indiferent)
        XCTAssertEqual(mehDay2.grade, .indiferent)
        XCTAssertEqual(badDay.grade, .poor)
        XCTAssertEqual(badDay2.grade, .poor)
        XCTAssertEqual(horribleDay.grade, .dreadfull)
        XCTAssertEqual(horribleDay2.grade, .dreadfull)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

private extension JournalEntry {
    convenience init(_ feeling: Feeling) {
        self.init("", feeling: feeling)
    }
}

private extension Day {
    convenience init(_ feelings: [Feeling]) {
        self.init(feelings.map { JournalEntry($0) })
    }
}
