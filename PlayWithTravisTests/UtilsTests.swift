//
//  UtilsTests.swift
//  PlayWithTravis
//
//  Created by Ali Moeeny on 10/2/15.
//  Copyright © 2015 Ali Moeeny. All rights reserved.
//

import Foundation
import XCTest

class UtilsTests: XCTestCase {
    func testMultiplexCount() {
        let dictionaryOfArrays = [1:[1,2],2:[3,4,5,6],3:[], 4:[7]]
        XCTAssertEqual(MultiplexedCount(dictionaryOfArrays), 7, "MultiplexedCount failed")
    }

    func testMultiplexCountForSelectKeys() {
        let dictionaryOfArrays = [1:[1,2],2:[3,4,5,6],3:[], 4:[7]]
        XCTAssertEqual(MultiplexedCount(dictionaryOfArrays, includeOnlyKeys: [2,4]), 5, "MultiplexedCount failed")
    }

    func testScan() {
        let dictionaryOfArrays = [1:[1,2],2:[3,4,5,6],3:[], 4:[7]]
        for idx in 0..<MultiplexedCount(dictionaryOfArrays) {
            XCTAssertEqual(Scan(dictionaryOfArrays, nominalIndex: idx, includOnlyKeys: [1,2,3,4])!, idx+1, "")
        }
    }

    func testMultiplex() {
        let dictionaryOfArrays = [1:[1,4],2:[2,5,6,7],3:[], 4:[3]]
        for idx in 0..<MultiplexedCount(dictionaryOfArrays) {
            XCTAssertEqual(Multiplex(dictionaryOfArrays, nominalIndex: idx, includOnlyKeys: [1,2,3,4])!, idx+1, "")
        }
    }
}