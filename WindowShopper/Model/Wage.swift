//
//  Wage.swift
//  WindowShopper
//
//  Created by Jeff Jeong on 2019. 6. 28..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

import Foundation

// 시급 모델 클래스
class Wage {
    // forWage wage
    // 매개변수이름 변수이름
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        // 올림 해서 반환
        return Int(ceil(price / wage))
    }
    
}

