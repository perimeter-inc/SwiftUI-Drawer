# SwiftUI-Drawer

A bottom-up drawer view.

## Contents

- [Installation](#Installation)
- [Examples](#Examples)

## Installation

### For Swift Packages

Add a dependency in your your `Package.swift` file

```swift
    .package(name: "Drawer", url: "https://github.com/bwide/SwiftUI-Drawer", from: "1.0.0")
```

## Examples

<img src=https://github.com/bwide/SwiftUI-Drawer/blob/main/Media/DrawerNoHandle.gif width=200 align="right" />

Simple Drawer with no handle

```swift
        ZStack {
            Color.black
            GeometryReader {
                Drawer {
                    EmptyView()
                }
                .background(color: .blue)
                .rest(in: [135, $0.size.height])
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
            GeometryReader {
                Drawer({
                    EmptyView()
                }, handle: {
                    DrawerHandles.defaultHandle
                })
                .background(color: .blue)
                .handle(height: 6, padding: 10)
                .rest(in: [135, $0.size.height])
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
        GeometryReader { geometry in
            Drawer({
                EmptyView()
            }, handle: {
                DrawerHandles.defaultHandle
            })
            .cornerRadius(radius)
            .onRest({ position in
                radius = position == geometry.size.height
                    ? 0
                    : 16
            })
            .onDrag({ _ in
                radius = 16
            })
            .background(color: .blue)
            .rest(in: [136, geometry.size.height])
            .handle(height: 6, padding: 10)
        }
```

<br />
<br />
<br />
<br />
<br />
<br />
<br />

<img src=https://github.com/bwide/SwiftUI-Drawer/blob/main/Media/DrawerScrollableContent.gif width=200 align="right" />

Drawer with scrollable content

```swift
        ZStack {
            Color.black
            GeometryReader {
                Drawer({
                    ZStack {
                        Color.blue
                        VStack {
                            ForEach(0..<100) {
                                Text("item \($0)")
                            }
                        }
                    }
                }, handle: {
                    DrawerHandles.defaultHandle
                })
                    .scrollableContent()
                    .background(color: .blue)
                    .handle(height: 6, padding: 10)
                    .rest(in: [135, $0.size.height])
                    .interactive(in: [$0.size.height])
            }
        }.edgesIgnoringSafeArea(.vertical)
```

