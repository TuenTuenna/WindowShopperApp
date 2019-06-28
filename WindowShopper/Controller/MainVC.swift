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
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
    }

    // #selector 는 objective-c 런타임을 사용하기 때문에 @objc 키워드를 사용해야한다.
    @objc func calculate() {
        NSLog("calculate(): %@", "계산 버튼이 클릭되었다!")
    }
    

}

