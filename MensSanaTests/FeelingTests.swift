//
//  FeelingTests.swift
//  MensSanaTests
//
//  Created by Otávio Zabaleta on 29/03/2023.
//

import XCTest
import SwiftUI
@testable import MensSana

final class FeelingTests: XCTestCase {
    func testScores() throws {
        // Then:
        XCTAssertEqual(Feeling.anger.score, -1)
        XCTAssertEqual(Feeling.anxiety.score, -1)
        XCTAssertEqual(Feeling.awkwardness.score, -1)
        XCTAssertEqual(Feeling.boredom.score, -1)
        XCTAssertEqual(Feeling.calmness.score, 1)
        XCTAssertEqual(Feeling.confusion.score, -1)
        XCTAssertEqual(Feeling.disgust.score, -1)
        XCTAssertEqual(Feeling.excitement.score, 1)
        XCTAssertEqual(Feeling.fear.score, -1)
        XCTAssertEqual(Feeling.fun.score, 1)
        XCTAssertEqual(Feeling.happiness.score, 1)
        XCTAssertEqual(Feeling.helplessness.score, -1)
        XCTAssertEqual(Feeling.sadness.score, -1)
        XCTAssertEqual(Feeling.joy.score, 1)
    }
    
    func testHasOneColourPerFeeling() throws {
        // Given:
        let allFeelings = Feeling.allCases
        let receivedColours = allFeelings.map { $0.colour }.uniqueValuesOnly
        
        // Then:
        XCTAssertEqual(allFeelings.count, receivedColours.count)
    }
}
