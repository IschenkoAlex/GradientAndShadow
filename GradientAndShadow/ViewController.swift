//
//  ViewController.swift
//  GradientAndShadow
//
//  Created by Alexander Ischenko on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - View
    
    let someView: UIView = {
        let view = UIView ()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.layer.cornerRadius = 10
        view.backgroundColor = .blue
        return view
    }()

    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someView)
        createSomeViewConstraints()
        createShadow()
        createGradient()

    }
    

    // MARK: - Methods
    
    func createSomeViewConstraints() {
        someView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        someView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        someView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        someView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
       
    func createShadow() {
        someView.layer.masksToBounds = false
        someView.layer.shadowColor = UIColor.gray.cgColor
        someView.layer.opacity = 0.6
        someView.layer.shadowOffset = CGSize(width: 10, height: 10)
        someView.layer.shadowRadius = 10
    }
        
    func createGradient(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.opacity = 0.8
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = someView.layer.cornerRadius
        gradient.frame = someView.bounds
        someView.layer.insertSublayer(gradient, at: 1)
    }
}
