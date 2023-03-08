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
    
    var viewModel: TransferFundViewModel
    
    init(viewModel: TransferFundViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupView()
        setupLayout()
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 12.dynamic
        
        addSubview(amountTextField)
    }
    
    private func setupLayout() {
        
        amountTextField.edgeAnchors /==/ edgeAnchors + 30
    }
    
    private func setupViewModel() {
        
    }
}
