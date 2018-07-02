//
//  CustomViewLayoutSetupable.swift
//  Swifty-Forecast
//
//  Created by Pawel Milek on 27/09/16.
//  Copyright © 2016 Pawel Milek. All rights reserved.
//

import Foundation


protocol CustomViewLayoutSetupable {
    var isConstraints: Bool { get set }
    func setupLayout()
}
