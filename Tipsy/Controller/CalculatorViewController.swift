//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Иван Семенов on 05.03.2024.
//

import UIKit

class CalculatorViewController: UIViewController {
    let mainView = CalculatorView()
    var tips: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        tipsTap()
        calculate()
        
    }
    func tipsTap() {
        let buttons = [mainView.zero0Button,
                       mainView.ten10Button,
                       mainView.twenty20Button]
        for button in buttons{
            button.addAction(UIAction(handler: { action in
                guard let button = action.sender as? UIButton,
                      let title = button.currentTitle,
                      let tipPercentage = Double(title.dropLast()) else { return }
                
                self.tips = tipPercentage / 100

            }), for: .touchUpInside)
        }
    }
    
    func calculate() {
        let tap = UIAction { _ in
            print(self.tips)
            
            
//            let vc = ResultViewControler()
//            self.navigationController?.pushViewController(vc, animated: true)
        }
        mainView.calculateButton.addAction(tap, for: .touchUpInside)
    }
    
}

