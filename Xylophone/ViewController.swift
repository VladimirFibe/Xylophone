import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let stack: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    var player: AVAudioPlayer!
    
    func playSound(_ title: String) {
        guard let url = Bundle.main.url(forResource: title, withExtension: "wav") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stack)
        setupConstraints()
        setupKeys()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func setupKeys() {
        let height = UIScreen.main.bounds.height
        let labels = ["C", "D", "E", "F", "G", "A", "B"]
        for i in labels.indices {
            let button = UIButton()
            let label = labels[i]
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            button.backgroundColor = UIColor.init(named: label)
            button.setTitle(label, for: .normal)
            button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: height * (1 - CGFloat(i + 3) * 0.035)).isActive = true
            stack.addArrangedSubview(button)
        }
    }
    
    @objc func keyPressed(_ sender: UIButton) {
        if let title = sender.currentTitle {
            playSound(title)
        }
    }
}

