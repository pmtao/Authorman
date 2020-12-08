//
//  Authorman+PhotoLibraryAuthorization.swift
//
//
//  Created by Meler Paine on 2020/12/8.
//

import Photos

extension Authorman: PhotoLibraryAuthorization {
  public static func request(_ handler: ((PHAuthorizationStatus) -> Void)?) {
    let status = Authorman.checkAuthorizationStatusForPhotoLibrary()
    
    switch status {
    case .authorized:
        print("PHPhotoLibrary 已授权")
        handler!(status)
    case .denied:
        print("PHPhotoLibrary 授权拒绝")
        handler!(status)
    case .notDetermined:
        print("PHPhotoLibrary 未授权")
        if handler != nil {
            print("PHPhotoLibrary 即将开始授权")
            PHPhotoLibrary.requestAuthorization(handler!)
        }
    case .restricted:
        print("PHPhotoLibrary 授权受限")
        handler!(status)
    default:
        break
    }
    
  }
  
  static func checkAuthorizationStatusForPhotoLibrary() -> PHAuthorizationStatus {
    let status = PHPhotoLibrary.authorizationStatus()
    return status
  }
}
