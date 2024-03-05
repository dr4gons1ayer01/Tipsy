//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Иван Семенов on 05.03.2024.
//

import UIKit

class CalculatorViewController: UIViewController {
    let mainView = CalculatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        calculate()
        
    }
    func calculate() {
        let tap = UIAction { _ in
            print("calculate")
            
            let vc = ResultViewControler()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        mainView.calculateButton.addAction(tap, for: .touchUpInside)
    }
    
}

