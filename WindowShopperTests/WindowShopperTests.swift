//
//  WindowShopperTests.swift
//  WindowShopperTests
//
//  Created by Jeff Jeong on 2019. 6. 28..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

import XCTest

class WindowShopperTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    // 프로 팁
    // 좋은 함수는 입력을 받고 출력을 반환한다.
    
    // 나쁜 함수는 전역변수를 설정하고 작동되기 위해서 다른 함수들에 의존한다.
    
    // 비즈니스 로직이 잘 작동하는지 확인하자
    func testGetHours() {
        XCTAssert(Wage.getHours(forWage: 25, andPrice: 100) == 4)
        XCTAssert(Wage.getHours(forWage: 15.50, andPrice: 250.53) == 17)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
