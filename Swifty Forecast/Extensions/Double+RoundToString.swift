//
//  Double+RoundToString.swift
//  Swifty-Forecast
//
//  Created by Pawel Milek on 28/09/16.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation

extension Double {
  
  var convertedToString: String {
    return String(format: "%.0f", self)
  }
  
}
