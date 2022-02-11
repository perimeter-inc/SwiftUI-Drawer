# SwiftUI-Drawer

A bottom-up drawer view.

## Contents

- [Installation](#Installation)
- [Examples](#Examples)

## Installation

### For Swift Packages

Add a dependency in your your `Package.swift`

```swift
    .package(name: "Drawer", url: "https://github.com/bwide/SwiftUI-Drawer", from: "0.4.0")
```


## Examples

<img src=https://github.com/bwide/SwiftUI-Drawer/blob/main/Media/DrawerNoHandle.gif width=200 align="right" />

Simple Drawer with no handle

```swift
    ZStack {
        Color.black
        GeometryReader { geometry in
            Drawer {
                Color.blue
            }
                .rest(in: [135, geometry.size.height])
        }
    }.edgesIgnoringSafeArea(.vertical)
```
<br />
<br />
<br />
<br />
<br />
<br />
<br />

<img src=https://github.com/bwide/SwiftUI-Drawer/blob/main/Media/Drawer.gif width=200 align="right" />
Drawer with the default handle

```swift
    ZStack {
        Color.black
        GeometryReader { geometry in
            Drawer({
                Color.blue
            }, handle: {
                DrawerHandles.defaultHandle
            })
                .withHandleOffset(13, and: 54)
                .rest(in: [135, geometry.size.height])
        }
    }.edgesIgnoringSafeArea(.vertical)
```

<br />
<br />
<br />
<br />
<br />
<br />
<br />

<img src=https://github.com/bwide/SwiftUI-Drawer/blob/main/Media/DrawerIphoneSE.gif width=200 align="right" />

Drawer with no rounded edges when reaching the top of the screen and a custom handle offset

```swift
    ZStack {
        Color.gray
        GeometryReader { geometry in
            Drawer {
                Color.blue
            }
            .cornerRadius(radius)
            .onRest({ position in
                radius = position == geometry.size.height
                    ? 0
                    : 16
            })
            .onDrag({ position in
                radius = 16
            })
            .rest(in: [136, geometry.size.height])
            .withHandleOffset(13, and: 43)
        }
    }.edgesIgnoringSafeArea(.vertical)
```

