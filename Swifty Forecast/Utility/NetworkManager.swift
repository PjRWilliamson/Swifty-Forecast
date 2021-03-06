//
//  NetworkManager.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 07/09/2018.
//  Copyright © 2018 Pawel Milek. All rights reserved.
//

import Foundation
import Reachability

final class NetworkManager {
  static let shared = NetworkManager()

  private let reachability: Reachability
  
  
  private init() {
    self.reachability = Reachability()!
    registerObserver()
    
    do {
      try reachability.startNotifier()
    } catch let error where error is ReachabilityError {
      let error = error as? ReachabilityError
      error?.handle()
      
    } catch let error {
      AlertViewPresenter.shared.presentError(withMessage: error.localizedDescription)
    }
  }
}


// MARK: - Private - Register observer
private extension NetworkManager {
  
  func registerObserver() {
    NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged(_:)), name: .reachabilityChanged, object: reachability)
  }
  
}


// MARK: - Private - Network status changed
private extension NetworkManager {
  
  @objc func networkStatusChanged(_ notification: Notification) {
    guard let reachability = notification.object as? Reachability else {
      print("Network status changed: Reachability not available!")
      return
    }
    
    switch reachability.connection {
    case .wifi:
      print("Reachable via WiFi")
      
    case .cellular:
      print("Reachable via Cellular")
      
    case .none:
      print("Network not reachable")
    }
  }
  
  
  func stopNotifier() -> () {
    reachability.stopNotifier()
  }

}


// MARK: - Network status checkers
extension NetworkManager {
  
  func isReachable(completionHandler: @escaping (_ networkManager: NetworkManager) -> ()) {
    if reachability.connection != .none {
      completionHandler(NetworkManager.shared)
    }
  }
  
  func isUnreachable(completionHandler: @escaping (_ networkManager: NetworkManager) -> ()) {
    if reachability.connection == .none {
      completionHandler(NetworkManager.shared)
    }
  }
  
  func isReachableViaWWANCellular(completionHandler: @escaping (_ networkManager: NetworkManager) -> ()) {
    if reachability.connection == .cellular {
      completionHandler(NetworkManager.shared)
    }
  }
  
  func isReachableViaWiFi(completionHandler: @escaping (_ networkManager: NetworkManager) -> ()) {
    if reachability.connection == .wifi {
      completionHandler(NetworkManager.shared)
    }
  }
  
  func whenReachable(completionHandler: @escaping (_ networkReachable: Reachability) -> ()) {
    reachability.whenReachable = completionHandler
  }
  
  func whenUnreachable(completionHandler: @escaping (_ networkReachable: Reachability) -> ()) {
    reachability.whenUnreachable = completionHandler
  }
}
