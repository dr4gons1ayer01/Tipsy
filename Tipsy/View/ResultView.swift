//
//  ResultView.swift
//  Tipsy
//
//  Created by Иван Семенов on 05.03.2024.
//

import UIKit

class ResultView: UIView {
    let topBackgroundView = UIView()
    let bottomBackgroundView = UIView()
    let totalPerPersonLabel = UILabel(text: "Итого на человека")
    let perPersonLabel = UILabel(text: "56.32")
    let splitDestinationLabel = UILabel(text: "Разделить между 2 людьми с 10% чаевых")
    let recalculateButton = UIButton(title: "Посчитать", bg: .systemGreen)
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    func setupUI() {
        topBackgroundView.backgroundColor = UIColor(named: "bg")
        bottomBackgroundView.backgroundColor = .white
        perPersonLabel.font = UIFont(name: "Gilroy-Bold", size: 40)
        perPersonLabel.textColor = .systemGreen
        splitDestinationLabel.numberOfLines = 0
        splitDestinationLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [totalPerPersonLabel,
                                                   perPersonLabel,
                                                   splitDestinationLabel,
                                                  ])
        stack.axis = .vertical
        stack.spacing = 30
        stack.setCustomSpacing(60, after: perPersonLabel)
        stack.alignment = .center
        
        addSubview(topBackgroundView)
        addSubview(bottomBackgroundView)
        addSubview(stack)
        addSubview(recalculateButton)
        topBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bottomBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBackgroundView.bottomAnchor.constraint(equalTo: splitDestinationLabel.topAnchor),
            
            bottomBackgroundView.topAnchor.constraint(equalTo: splitDestinationLabel.topAnchor, constant: -10),
            bottomBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            recalculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recalculateButton.widthAnchor.constraint(equalTo: stack.widthAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
import SwiftUI

struct ResultViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = ResultView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
