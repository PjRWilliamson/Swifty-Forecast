//
//  ConditionView.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 04/07/2018.
//  Copyright © 2018 Pawel Milek. All rights reserved.
//

import UIKit

class ConditionView: UIView {
  @IBOutlet private var contentView: UIView!
  @IBOutlet private weak var conditionLabel: UILabel!
  @IBOutlet private weak var valueLabel: UILabel!
  
  typealias ConditionStyle = Style.Condition
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    setupStyle()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
    setupStyle()
  }
}


// MARK: ViewSetupable protocol
extension ConditionView: ViewSetupable {
  
  func setup() {
    let nibName = ConditionView.nibName
    Bundle.main.loadNibNamed(nibName, owner: self, options: [:])
    
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.layer.cornerRadius = ConditionStyle.cornerRadius
    contentView.clipsToBounds = true
    layer.cornerRadius = ConditionStyle.cornerRadius
    clipsToBounds = true
    
    contentView.backgroundColor = ConditionStyle.backgroundColor
    backgroundColor = .clear
  }
  
  func setupStyle() {
    valueLabel.font = ConditionStyle.valueLabelFont
    valueLabel.textColor = ConditionStyle.textColor
    valueLabel.textAlignment = ConditionStyle.textAlignment
    
    conditionLabel.textColor = ConditionStyle.textColor
    conditionLabel.textAlignment = ConditionStyle.textAlignment
  }
  
}


// MARK: Configurate
extension ConditionView {
  
  func configure(condition icon: FontWeatherIconType, value: String) {
    conditionLabel.attributedText = icon.attributedString(font: 16)
    valueLabel.text = value
  }
  
}
