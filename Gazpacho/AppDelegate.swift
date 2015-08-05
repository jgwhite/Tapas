//
//  AppDelegate.swift
//  Gazpacho
//
//  Created by Jamie White on 14/06/2015.
//  Copyright © 2015 Jamie White. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainViewController: MainViewController?

    var mainWindow: NSWindow? {
        return NSApplication.sharedApplication().windows[0]
    }

    @IBAction func showMainWindow(sender: AnyObject) {
        showMainWindow()
    }

    @IBAction func signOut(sender: AnyObject) {
        if let mainViewController = mainViewController {
            mainViewController.signOut()
        }
    }

    @IBAction func openWebsite(send: AnyObject) {
        let url = NSURL(string: "http://www.rubytapas.com/")!
        NSWorkspace.sharedWorkspace().openURL(url)
    }

    func showMainWindow() {
        mainWindow?.makeKeyAndOrderFront(self)
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        mainWindow?.excludedFromWindowsMenu = true
    }

    func applicationShouldHandleReopen(app: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        showMainWindow()
        return true
    }

}

