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
    var billTotal = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        tipsTap()
        calculate()
        
    }
    ///
    func calculate() {
        let tap = UIAction { _ in
            guard let billText = self.mainView.billTF.text,
                  let billTotal = Double(billText) else { return }
            
            let peoples = Int(self.mainView.stepper.value)
            let totalTips = billTotal * (1 + self.tips)
            let result = totalTips / Double(peoples)
            
            let vc = ResultViewControler()
            vc.billTotal = result
            vc.peoples = peoples
            vc.tips = Int(self.tips * 100)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        mainView.calculateButton.addAction(tap, for: .touchUpInside)
    }
    ///
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
                self.updateTipButtonAppearance()
            }), for: .touchUpInside)
        }
    }
    ///
    func updateTipButtonAppearance() {
        let tipButtons:[Double: UIButton] = [0: mainView.zero0Button,
                                           10: mainView.ten10Button,
                                           20: mainView.twenty20Button]
        for (tipPercent, button) in tipButtons {
            if tipPercent == self.tips * 100 {
                button.backgroundColor = .systemGreen
                button.setTitleColor(.white, for: .normal)
            } else {
                button.backgroundColor = .clear
                button.setTitleColor(.systemGreen, for: .normal)
            }
        }
    }
}

