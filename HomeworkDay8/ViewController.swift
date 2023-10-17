//
//  ViewController.swift
//  HomeworkDay8
//
//  Created by Hung Vu on 17/10/2023.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var diamondImage: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        diamondImage.alpha = 0
        textLabel.alpha = 0
        UIView.animate(withDuration: 2, delay: 5, animations: {
            self.diamondImage.alpha = 1
            self.textLabel.alpha = 1
            self.textLabel.transform = CGAffineTransform(translationX: 0, y: -(self.textLabel.bounds.height + 100))
        })
    }
}

