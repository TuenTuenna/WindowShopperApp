//
//  CurrencyTextField.swift
//  WindowShopper
//
//  Created by Jeff Jeong on 2019. 6. 28..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

import UIKit

// 커스텀 ui text field 클래스
// @IBDesignable 인터페이스를 사용한다.
@IBDesignable
class CurrencyTextField: UITextField {
    
    // 그린다.
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        // x, y 포지션, 가로크기, 세로크리
        let currencyLbl = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - size / 2, width: size, height: size))
        currencyLbl.backgroundColor = #colorLiteral(red: 0.9069836612, green: 0.9069836612, blue: 0.9069836612, alpha: 0.8101990582)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLbl.layer.cornerRadius = 5.0
        
        currencyLbl.clipsToBounds = true
        
        // 숫자 포맷
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        formatter.locale = .current
        currencyLbl.text = formatter.currencySymbol

        // 뷰에 추가한다.
        addSubview(currencyLbl)
    }
    
    

    
  
    
    
    // IBDesignable 인터페이스에 있는 함수를 호출함으로써
    // 인터페이스 빌더에서 변경되는 사항들을 런타임으로 바로 볼수 있다.
    override func prepareForInterfaceBuilder() {
        // 뷰를 커스텀으로 변경한다.
        customizeView()
    }
    
    // 런타임 호출
    override func awakeFromNib() {
        super.awakeFromNib()
        // 뷰를 커스텀으로 변경한다.
        customizeView()
        
    }
    
    // 뷰를 커스텀하는 함수
    func customizeView() {
        // 배경색 설정
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1545644264)
        // 모서리 둥글게
        layer.cornerRadius = 5.0
        // 가운데 정렬
        textAlignment = .center
        
        //
        clipsToBounds = true
        
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
