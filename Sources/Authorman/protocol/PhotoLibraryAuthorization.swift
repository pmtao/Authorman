//
//  File.swift
//  
//
//  Created by Meler Paine on 2020/12/8.
//

import Photos

protocol PhotoLibraryAuthorization {
  static func request(_ handler: ((PHAuthorizationStatus) -> Void)?)
  
  static func checkAuthorizationStatusForPhotoLibrary() -> PHAuthorizationStatus
}
