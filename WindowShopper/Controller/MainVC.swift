//
//  ViewController.swift
//  WindowShopper
//
//  Created by Jeff Jeong on 2019. 6. 28..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // 시급 텍스트필드
    @IBOutlet weak var wageTxt: CurrencyTextField!
    // 사고싶은 물건 가격 텍스트필드
    @IBOutlet weak var priceTxt: CurrencyTextField!
    
    // 계산 결과 레이블
    @IBOutlet weak var resultLbl: UILabel!
    // 시간 레이블
    @IBOutlet weak var hoursLbl: UILabel!
    
    
    // 뷰가 로드되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 계산 버튼 설정
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.5497456657, blue: 0.231640632, alpha: 1)
        calcBtn.setTitle("시간 계산", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        // #selector 는 objective-c 런타임을 사용하기 때문에
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTxt.delegate = self
        priceTxt.delegate = self
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        
        
    }

    // #selector 는 objective-c 런타임을 사용하기 때문에 @objc 키워드를 사용해야한다.
    @objc func calculate() {
        NSLog("calculate(): %@", "계산 버튼이 클릭되었다!")
        
        // 입력부분에 들어가 져있는 콤마를 없앤다.
        let wageNumber = wageTxt.text?.replacingOccurrences(of: ",", with: "") // 콤마(,) 삭제
        let priceNumber = priceTxt.text?.replacingOccurrences(of: ",", with: "") // 콤마(,) 삭제
        
        
        // nil 이 아니면
        if let wageTxt = wageNumber, let priceTxt = priceNumber {
            // 형변환 이상없으면
            if let wage = Double(wageTxt), let price = Double(priceTxt){
                // 키보드 없애기
                view.endEditing(true)
                resultLbl.isHidden = false
                hoursLbl.isHidden = false
                // 계산결과 ui에 적용
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
                
            }
        }
        
    }
    
    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
}

extension MainVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // replacementString : 방금 입력된 문자 하나, 붙여넣기 시에는 붙여넣어진 문자열 전체
        // return -> 텍스트가 바뀌어야 한다면 true, 아니라면 false
        // 이 메소드 내에서 textField.text는 현재 입력된 string이 붙기 전의 string
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal // 1,000,000
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0 // 허용하는 소숫점 자리수
        
        // formatter.groupingSeparator // .decimal -> ,
        
        if let removeAllSeprator = textField.text?.replacingOccurrences(of: formatter.groupingSeparator, with: ""){
            var beforeForemattedString = removeAllSeprator + string
            if formatter.number(from: string) != nil {
                if let formattedNumber = formatter.number(from: beforeForemattedString), let formattedString = formatter.string(from: formattedNumber){
                    textField.text = formattedString
                    return false
                }
            }else{ // 숫자가 아닐 때
                if string == "" { // 백스페이스일때
                    let lastIndex = beforeForemattedString.index(beforeForemattedString.endIndex, offsetBy: -1)
                    beforeForemattedString = String(beforeForemattedString[..<lastIndex])
                    if let formattedNumber = formatter.number(from: beforeForemattedString), let formattedString = formatter.string(from: formattedNumber){
                        textField.text = formattedString
                        return false
                    }
                }else{ // 문자일 때
                    return false
                }
            }
            
        }
        
        return true
    }
}


