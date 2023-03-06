//
//  UIButton + Extensions.swift
//  FathersKick2
//
//  Created by Андрей Абакумов on 06.03.2023.
//

import UIKit

class ButtonTemplate: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    convenience init(text: String) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tintColor = .white
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 22, bottom: 10, right: 14)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        semanticContentAttribute = .forceRightToLeft
        translatesAutoresizingMaskIntoConstraints = false
    }
}

//MARK: - Animation

extension ButtonTemplate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .allowUserInteraction) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .allowUserInteraction) {
            self.transform = CGAffineTransform.identity
        }
    }
}

//MARK: - Change tintColor

extension ButtonTemplate {
    
    override func tintColorDidChange(){
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            layer.backgroundColor = UIColor.systemGray.cgColor
        } else {
            layer.backgroundColor = UIColor.systemBlue.cgColor
        }
    }
}
