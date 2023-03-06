//
//  ViewController.swift
//  FathersKick2
//
//  Created by Андрей Абакумов on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let firstButton = ButtonTemplate(text: "First Button")
    private let secondButton = ButtonTemplate(text: "Second Middle Button")
    private let thirdButton = ButtonTemplate(text: "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        thirdButton.addTarget(self, action: #selector(thirdButtonTapped), for: .touchUpInside)

    }
    
    @objc func thirdButtonTapped() {
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true) {
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20)
        ])
    }
}
