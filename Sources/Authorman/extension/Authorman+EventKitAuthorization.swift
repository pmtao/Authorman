//
//  File.swift
//  
//
//  Created by Meler Paine on 2020/12/8.
//

import EventKit

extension Authorman: EventKitAuthorization {
  public static func request(type: EKEntityType, handler: ((Bool, Error?) -> Void)?) {
    let status = Authorman.checkAuthorizationStatusForEventKit(type: type)
    
    switch status {
    case .authorized:
        print("EventKit 已授权")
      handler!(true, nil)
    case .denied:
        print("EventKit 授权拒绝")
      handler!(false, nil)
    case .notDetermined:
        print("EventKit 未授权")
        if handler != nil {
            print("EventKit 即将开始授权")
          EKEventStore().requestAccess(to: type, completion: handler!)
        }
    case .restricted:
        print("EventKit 授权受限")
      handler!(false, nil)
    default:
        break
    }
  }
  
  static func checkAuthorizationStatusForEventKit(type: EKEntityType) -> EKAuthorizationStatus {
    let status = EKEventStore.authorizationStatus(for: type)
    return status
  }
}
