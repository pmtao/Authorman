//
//  File.swift
//  
//
//  Created by Meler Paine on 2020/12/8.
//

import EventKit

protocol EventKitAuthorization {
  static func request(type: EKEntityType, handler: ((Bool, Error?) -> Void)?)
  
  static func checkAuthorizationStatusForEventKit(type: EKEntityType) -> EKAuthorizationStatus
}

