//
//  CurrencyTextField.swift
//  WindowShopper
//
//  Created by Jeff Jeong on 2019. 6. 28..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

import UIKit

// 커스텀 ui text field 클래스
class CurrencyTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        // 배경색 설정
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1545644264)
        // 모서리 둥글게
        layer.cornerRadius = 5.0
        // 가운데 정렬
        textAlignment = .center
        
//        // 플레이스 홀더가 없으면
//        // nil 체크
//        if placeholder == nil {
//            placeholder = " "
//        }
        
//        // safety check
//        // placeholder! 를 해도 된다 왜냐면 위에서 nil체크를 통해 nil 이 들어있지 않기 때문에
//        let place = NSAttributedString(string: placeholder!, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
//        //
//        attributedPlaceholder = place
//        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // 이렇게 함으로써 nil 방지
        if let p = placeholder {
            // safety check
            // placeholder! 를 해도 된다 왜냐면 위에서 nil체크를 통해 nil 이 들어있지 않기 때문에
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            //
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }

}
