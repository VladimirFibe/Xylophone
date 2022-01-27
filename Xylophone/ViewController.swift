//
//  ViewController.swift
//  Xylophone
//
//  Created by Vladimir Fibe on 26.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  private var buttons: [UIButton] = []

  var player: AVAudioPlayer!

  func playSound(_ title: String) {
      guard let url = Bundle.main.url(forResource: title, withExtension: "wav") else { return }
    player = try! AVAudioPlayer(contentsOf: url)
    player.play()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  func setupUI() {
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
    let labels = ["C", "D", "E", "F", "G", "A", "B"]
    for i in 0..<7 {
      let button = UIButton()
      button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
      button.backgroundColor = UIColor.init(named: labels[i])
      button.setTitle(labels[i], for: .normal)
      button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
      button.layer.cornerRadius = 10
      buttons.append(button)
      view.addSubview(button)
    }
  }

  @objc func keyPressed(_ sender: UIButton) {
    if let title = sender.currentTitle { playSound(title)}
  }
}

