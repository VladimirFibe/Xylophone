//
//  ViewController.swift
//  Xylophone
//
//  Created by Vladimir Fibe on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {

  private var buttons: [UIButton] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupKeys()
    let stack = UIStackView(arrangedSubviews: buttons)
    let padding = 20.0
    stack.axis = .vertical
    stack.alignment = .center
    stack.distribution = .fillEqually
    stack.spacing = 8
    view.addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 2 * padding).isActive = true
    stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2 * padding).isActive = true
    stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
    stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
    for i in buttons.indices {
      let button = buttons[i]
      button.translatesAutoresizingMaskIntoConstraints = false
      button.widthAnchor.constraint(equalTo: stack.widthAnchor, multiplier: 1 - CGFloat(i) * 0.04).isActive = true
    }
  }

  func setupKeys() {
    let colors = [#colorLiteral(red: 1, green: 0.2332399487, blue: 0.1861645281, alpha: 1), #colorLiteral(red: 0.802870214, green: 0.466054678, blue: 0.02099951915, alpha: 1), #colorLiteral(red: 0.8019409776, green: 0.6408478618, blue: 0.03579719737, alpha: 1), #colorLiteral(red: 0.1716196239, green: 0.6244929433, blue: 0.2817935944, alpha: 1), #colorLiteral(red: 0.2753639221, green: 0.270437181, blue: 0.6706653237, alpha: 1), #colorLiteral(red: 0.02625587583, green: 0.3824955523, blue: 0.7998301387, alpha: 1), #colorLiteral(red: 0.5465310216, green: 0.2587155104, blue: 0.6929754615, alpha: 1)]
    let labels = ["C", "D", "E", "F", "G", "A", "B"]
    for i in 0..<7 {
      let button = UIButton()
      button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
      button.backgroundColor = colors[i]
      button.setTitle(labels[i], for: .normal)
      button.addTarget(self, action: #selector(handle), for: .touchUpInside)
      buttons.append(button)
      view.addSubview(button)
    }
  }

  @objc func handle(_ sender: UIButton) {
    if let title = sender.currentTitle {
      print(title)
    }
  }
}

