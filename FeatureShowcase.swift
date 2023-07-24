//
//  ViewController.swift
//  Showcase
//
//  Created by dev on 24.07.2023.
//

import UIKit

class FeatureShowcase: UIViewController {
    
    let innerCircle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        view.setAsCircle()
        return view
    }()

    let blueCircle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        view.setAsCircle()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        return label
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitle("Понятно", for: .normal)
        return button
    }()
    
    let stack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.contentMode = .scaleToFill
        return stackView
    }()
    
    enum BlueCirclePosition {
        case topLeading
        case top
        case topTrailing
        case leading
        case centre
        case trailing
        case bottomLeading
        case bottomTrailing
    }
    
    enum TargetTextPosition {
        case above // at upper screen part
        case below // at lower screen part
        case leading // at left from target
        case trailing // at right from target
        case topLeadind
        case topTrailing
        case bottomLeading
        case bottomTrailing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.173, green: 0.173, blue: 0.180, alpha: 0.3)
        
        innerCircle.backgroundColor = .red.withAlphaComponent(0.3)
        
//        stack.addArrangedSubview(titleLabel)
//        stack.addArrangedSubview(subtitle)
//        stack.addArrangedSubview(button)
    }

    func addTarget(view: UIView ) {
        innerCircle.center = view.center
        var frame = view.frame
        frame.size.width = view.bounds.width + 10
        
        innerCircle.frame = frame

    }
    
    /// Detects the position of target view relative to its container
    func getTargetPosition(target: UIView) -> TargetTextPosition {
      let center = calculateCenter(at: target, to: view)
        
      if center.y < view.frame.height / 2 {
        return .above
      } else {
        return .below
      }
    }
    
    
    // Calculates the center point based on targetview
    func calculateCenter(at targetView: UIView, to containerView: UIView) -> CGPoint {
      let targetRect = targetView.convert(targetView.bounds , to: containerView)
        return CGPoint(x: targetRect.midX, y: targetRect.midY)
      
    }
    
}




extension UIView {
    
    func setAsCircle() {
      setCornerRadius(self.frame.width / 2)
    }
    
    
    func setCornerRadius(_ radius: CGFloat) {
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
    }
}
