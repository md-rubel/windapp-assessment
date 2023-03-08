//
//  TransferFundAmountInputView.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit
import Anchorage

class TransferFundAmountInputView: UIView {
    
    let amountTextField = with(UITextField()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.borderStyle = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.keyboardType = .numberPad
        $0.font = Theme.Font.medium.withSize(36.dynamic)
        $0.textColor = Theme.Color.label
        
        let prefix = with(UILabel()) {
            $0.text = "$"
            $0.sizeToFit()
            $0.font = Theme.Font.medium.withSize(36.dynamic)
            $0.textColor = Theme.Color.label
        }
        
        $0.leftView = prefix
        $0.leftViewMode = .always
    }
    
    let maxButton = with(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(TransferFundResource.max.string, for: .normal)
        $0.setTitleColor(Theme.Color.label, for: .normal)
        $0.titleLabel?.font = Theme.Font.medium.withSize(16.dynamic)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 6.dynamic
        $0.clipsToBounds = true
    }
    
    let balanceLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.regular.withSize(12.dynamic)
        $0.textColor = Theme.Color.labelSecondary
        $0.numberOfLines = 1
        $0.text = "Balance USDC"
    }
    
    let usdcLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Theme.Font.regular.withSize(12.dynamic)
        $0.textColor = Theme.Color.labelSecondary
        $0.numberOfLines = 1
        $0.text = "USDC"
    }
    
    var viewModel: TransferFundViewModel
    
    init(viewModel: TransferFundViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupView()
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 12.dynamic
        
        addSubview(amountTextField)
        addSubview(maxButton)
        addSubview(usdcLabel)
        addSubview(balanceLabel)
    }
    
    private func setupLayout() {
        let margin = 20.dynamic
        
        amountTextField.leftAnchor /==/ leftAnchor + margin
        amountTextField.topAnchor /==/ topAnchor + margin
        amountTextField.rightAnchor /==/ maxButton.leftAnchor - 8.dynamic
        
        maxButton.heightAnchor /==/ 32.dynamic
        maxButton.widthAnchor /==/ 52.dynamic
        maxButton.rightAnchor /==/ rightAnchor - margin
        maxButton.centerYAnchor /==/ amountTextField.centerYAnchor
        maxButton.dropShadow(opacity: 0.11, radius: 3)
        
        usdcLabel.topAnchor /==/ amountTextField.bottomAnchor + 16.dynamic
        usdcLabel.leftAnchor /==/ amountTextField.leftAnchor
        usdcLabel.rightAnchor /==/ balanceLabel.leftAnchor - 8.dynamic
        usdcLabel.bottomAnchor /==/ bottomAnchor - margin
        
        balanceLabel.topAnchor /==/ usdcLabel.topAnchor
        balanceLabel.bottomAnchor /==/ usdcLabel.bottomAnchor
        balanceLabel.rightAnchor /==/ maxButton.rightAnchor
        
        gradientBackground(colors: [UIColor(hex: "#FCF4FA"),
                                    UIColor(hex: "#FDF5F7"),
                                    UIColor(hex: "#FAF5E8")],
                           isVertical: false)
        
        gradientBorder(colors: [UIColor(hex: "#FFA450"),
                                UIColor(hex: "#6E50FF")],
                       isVertical: false)
    }
    
    private func setupViewModel() {
        
    }
}
