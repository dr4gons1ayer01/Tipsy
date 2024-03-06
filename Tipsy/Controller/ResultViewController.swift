//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Иван Семенов on 05.03.2024.
//

import UIKit

class ResultViewControler: UIViewController {
    let mainView = ResultView()
    var tips: Int = 0
    var peoples = 2
    var billTotal = 0.0

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
    ///
    func updateUI() {
        mainView.totalLabel.text = String(format: "%.2f",  billTotal)
        mainView.settigsLabel.text = "Разделить между \(peoples) людьми с \(tips)% чаевых"
    }
    ///
    func recalculate() {
        let tap = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
        }
        mainView.recalculateButton.addAction(tap, for: .touchUpInside)
    }
    

}

