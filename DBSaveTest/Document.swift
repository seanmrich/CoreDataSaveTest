import Cocoa
import SwiftUI

class Document: NSPersistentDocument {
    override class var autosavesInPlace: Bool { true }

    override func makeWindowControllers() {
        _ = managedObjectModel
        let contentView = ContentView().environment(\.managedObjectContext, self.managedObjectContext!)

        // Create the window and set the content view.
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.contentView = NSHostingView(rootView: contentView)
        let windowController = NSWindowController(window: window)
        self.addWindowController(windowController)
    }
}
