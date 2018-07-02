//
//  Parser.swift
//  Swifty-Forecast
//
//  Created by Pawel Milek on 27/06/2018.
//  Copyright © 2018 Pawel Milek. All rights reserved.
//

import Foundation

struct Parser<M> where M: Decodable {
  
  static func parseJSON(_ data: Data) -> WebServiceResultType<M, WebServiceError> {
    
    do {
      let decodedModel = try JSONDecoder().decode(M.self, from: data)
      return .success(decodedModel)
      
    } catch let error {
      print(error)
      return .failure(WebServiceError.decodeFailed)
    }
    
//    if let decodedModel = try? JSONDecoder().decode(M.self, from: data) {
//      return .success(decodedModel)
//    } else {
//      return .failure(WebServiceError.decodeFailed)
//    }
  }
}
