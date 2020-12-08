# 项目说明

本项目为 iOS 系统权限请求相关的方法集合框架，包括各类隐私权限。

## 相册授权

Info.plist 中需要添加记录：Privacy - Photo Library Usage Description

```swift
import Authorman
import Photos

Authorman.request { (status) in
  if status == .authorized {
    // ...
  }
}
```

## 日历授权

Info.plist 中需要添加记录：Privacy - Calendars Usage Description

```swift
Authorman.request(type: .event) { (success, error) in
  if success {
    // ...
  } else {
    // ...
  }
}
```

## 提醒事项授权

Info.plist 中需要添加记录：Privacy - Reminders Usage Description

```swift
Authorman.request(type: .reminder) { (success, error) in
  if success {
    // ...
  } else {
    // ...
  }
}
```

## 如何新增授权类型

- 新增授权协议 XXXAuthorization
- 在协议内定义两个方法：
  - `request`
  - `checkAuthorizationStatusForXXX`
- 添加 Authorman 扩展文件，实现协议 XXXAuthorization 对应的方法
