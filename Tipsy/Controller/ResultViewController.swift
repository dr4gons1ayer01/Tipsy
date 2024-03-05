//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Иван Семенов on 05.03.2024.
//

import UIKit

class ResultViewControler: UIViewController {
    let mainView = ResultView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        recalculate()
        updateUI()
        
    }
    func updateUI() {
        
    }
    
    func recalculate() {
        let tap = UIAction { _ in
            
            self.navigationController?.popViewController(animated: true)
        }
        mainView.recalculateButton.addAction(tap, for: .touchUpInside)
    }
    

}
