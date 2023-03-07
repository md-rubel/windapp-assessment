//
//  ViewControllerBased.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit

protocol ViewControllerBased {
    func setupView()
    func setupLayout()
    func setupViewModel()
    func setupReactive()
}

class BaseViewController: UIViewController, ViewControllerBased {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        setupViewModel()
        setupReactive()
    }
    
    func setupView() { }
    func setupLayout() { }
    func setupViewModel() { }
    func setupReactive() { }
}
