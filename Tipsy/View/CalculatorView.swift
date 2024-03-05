//
//  CalculatorView.swift
//  Tipsy
//
//  Created by Иван Семенов on 05.03.2024.
//

import UIKit

class CalculatorView: UIView {
    let topBackgroundView = UIView()
    let bottomBackgroundView = UIView()
    
    let enterBillTotal = UILabel(text: "Введите общую сумму счета")
    let billTF = UITextField(placeholder: "123.456")
    
    let selectTipLabel = UILabel(text: "Выберите чаевые")
    let zero0Button = UIButton(title: "0%", bg: .systemGreen)
    let ten10Button = UIButton(title: "10%", bg: .systemGreen)
    let twenty20Button = UIButton(title: "20%", bg: .systemGreen)
    
    let chooseSplitLabel = UILabel(text: "Выберите количество людей")
    let splitNumberLabel = UILabel(text: "2")
    let stepper = UIStepper()
    
    let calculateButton = UIButton(title: "Посчитать", bg: .systemGreen)
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    func setupUI() {
        topBackgroundView.backgroundColor = .white
        bottomBackgroundView.backgroundColor = UIColor(named: "bg")

        stepper.minimumValue = 2
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        splitNumberLabel.font = UIFont(name: "Gilroy-Regular", size: 35)

        let tipsStack = UIStackView(arrangedSubviews: [zero0Button,
                                                       ten10Button,
                                                       twenty20Button,])
        tipsStack.axis = .horizontal
        tipsStack.spacing = 30
        tipsStack.alignment = .center
        
        let stepperStack = UIStackView(arrangedSubviews: [splitNumberLabel,
                                                          stepper,])
        stepperStack.axis = .horizontal
        stepperStack.spacing = 70
        
        let stack = UIStackView(arrangedSubviews: [enterBillTotal,
                                                   billTF,
                                                   selectTipLabel,
                                                   tipsStack,
                                                   chooseSplitLabel,
                                                   stepperStack,])
        stack.axis = .vertical
        stack.spacing = 30
        stack.alignment = .center
        
        addSubview(topBackgroundView)
        addSubview(bottomBackgroundView)
        addSubview(stack)
        addSubview(calculateButton)
        topBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bottomBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBackgroundView.bottomAnchor.constraint(equalTo: selectTipLabel.topAnchor),
            
            bottomBackgroundView.topAnchor.constraint(equalTo: selectTipLabel.topAnchor, constant: -10),
            bottomBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            billTF.widthAnchor.constraint(equalTo: stack.widthAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.widthAnchor.constraint(equalTo: stack.widthAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    @objc private func stepperValueChanged() {
        splitNumberLabel.text = "\(Int(stepper.value))"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        font = UIFont(name: "Gilroy-Regular", size: 25)
    }
}
extension UIButton {
    convenience init(title: String, bg: UIColor) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 25)
        backgroundColor = bg
        layer.cornerRadius = 12
        widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        backgroundColor = .white
        font = UIFont(name: "Gilroy-Regular", size: 25)
        layer.cornerRadius = 12
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
        heightAnchor.constraint(equalToConstant: 36).isActive = true
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))  //левый отступ
        leftViewMode = .always
    }
}

import SwiftUI

struct CalculatorViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = CalculatorView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
