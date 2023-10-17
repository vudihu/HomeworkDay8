//
//  BMIViewController.swift
//  HomeworkDay8
//
//  Created by Hung Vu on 18/10/2023.
//

import UIKit

final class BMIViewController: UIViewController {
    @IBOutlet private weak var maleView: UIView!
    @IBOutlet private weak var femaleView: UIView!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weigthLabel: UILabel!
    @IBOutlet private weak var agelabel: UILabel!
    @IBOutlet private weak var painWeightButton: UIButton!
    @IBOutlet private weak var plusWeightButton: UIButton!
    @IBOutlet private weak var painAgeButton: UIButton!
    @IBOutlet private weak var plusAgeButton: UIButton!
    @IBOutlet private weak var heightSlider: UISlider!
    var countWeight: Int = 0
    var countAge: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 200
        heightSlider.value = 0
        heightSlider.addTarget(self, action: #selector(changeValueSlider), for: .valueChanged)
        
        let tapMale = UITapGestureRecognizer(target: self, action: #selector(tapToChoiceMale))
        maleView.addGestureRecognizer(tapMale)
        
        let tapFemale = UITapGestureRecognizer(target: self, action: #selector(tapToChoiceFemale))
        femaleView.addGestureRecognizer(tapFemale)
    }
    
    @objc func tapToChoiceMale(_ gesture: UITapGestureRecognizer) {
        maleView.backgroundColor = .systemGray3
        femaleView.backgroundColor = .white
        
    }
    
    @objc func tapToChoiceFemale(_ gesture: UITapGestureRecognizer) {
        femaleView.backgroundColor = .systemGray3
        maleView.backgroundColor = .white
    }
    
    @objc func changeValueSlider(_ sender: UISlider) {
        let value = Int(sender.value)
        heightLabel.text = String(value)
        
    }
    
    @IBAction func tapToPainWeight(_ sender: Any) {
        if countWeight > 0{
            countWeight -= 1
            weigthLabel.text = String(countWeight)
        }
    }
    @IBAction func tapToPlusWeight(_ sender: Any) {
        countWeight += 1
        weigthLabel.text = String(countWeight)
    }
    @IBAction func tapToPainAge(_ sender: Any) {
        if countAge > 0 {
            countAge -= 1
            agelabel.text = String(countAge)
        }
    }
    @IBAction func tapToPlusAge(_ sender: Any) {
        countAge += 1
        agelabel.text = String(countAge)
    }
}
