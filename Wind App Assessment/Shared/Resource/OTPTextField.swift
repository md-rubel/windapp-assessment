//
//  OTPTextField.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit

protocol OTPTextFieldDelegate: AnyObject {
    func enableNextButton()
    func disableNextButton()
    func becomingFirstResponder()
}

class OTPTextField: UITextField {
    
    weak var otpDelegate: OTPTextFieldDelegate?
    
    private var defaultCharacter = ""
    private var isConfigured = false
    private var digitLabels = [UILabel]()
    private var isWarningShowing: Bool = false
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeResponder))
        return recognizer
    }()
    
    @objc func becomeResponder() {
        otpDelegate?.becomingFirstResponder()
        becomeFirstResponder()
    }
    
    // ===================================
    // MARK: - Public methods
    // ===================================
    
    func configure(with slotCount: Int = 4) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        
        configureTextField()
        
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func updateForBottomOnlyBorder() {
        digitLabels.forEach {
            $0.layer.cornerRadius = 0
            $0.layer.borderWidth = 0
            $0.clipsToBounds = false
            
            let layer = CALayer()
            layer.frame = CGRect(x: 0, y: $0.frame.height - 3, width: $0.frame.width, height: 3)
            layer.backgroundColor = UIColor.black.cgColor
            layer.cornerRadius = 2
            $0.layer.addSublayer(layer)
        }
    }
    
    func clearText(force: Bool = false) {
        
        if isWarningShowing || force {
            isWarningShowing = false
            
            self.text = ""
            textDidChange()
            
            for i in 0 ..< digitLabels.count {
                digitLabels[i].layer.borderColor = UIColor.gray.cgColor
            }
        }
    }
    
    func showWarning() {
        isWarningShowing = true
        
        for i in 0 ..< digitLabels.count {
            digitLabels[i].layer.borderColor = UIColor.red.cgColor
        }
    }
    
    // ===================================
    // MARK: - Private methods
    // ===================================
    
    private func configureTextField() {
        backgroundColor = .clear
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        
        for _ in 1 ... count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 36)
            label.isUserInteractionEnabled = true
            label.text = defaultCharacter
            label.backgroundColor = .clear
            label.layer.cornerRadius = 5
            label.layer.borderWidth = 0.6
            label.layer.borderColor = UIColor.gray.cgColor
            label.clipsToBounds = true
            
            stackView.addArrangedSubview(label)
            
            digitLabels.append(label)
        }
        
        return stackView
    }
    
    @objc
    private func textDidChange() {
        
        guard let text = self.text, text.count <= digitLabels.count else { return }
        
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                //let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = "*" // String(text[index])
            } else {
                currentLabel.text = defaultCharacter
            }
            
        }
        
        print("==> text.count \(text.count)")
        
        if text.count == digitLabels.count {
            otpDelegate?.enableNextButton()
            
        } else {
            otpDelegate?.disableNextButton()
        }
    }
    
}

extension OTPTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabels.count || string == ""
    }
}
