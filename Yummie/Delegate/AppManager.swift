//
//  AppManager.swift
//  ReachOut
//
//  Created by FTS-MAC-017 on 07/01/16.
//  Copyright © 2016 Fingent Technology Solutions. All rights reserved.
//

import UIKit
import Foundation

class AppManager: NSObject{
  var delegate:AppManagerDelegate? = nil
  private var _useClosures:Bool = false
  private var reachability: Reachability?
  private var _isReachability:Bool = false
  private var _reachabiltyNetworkType :String?

  var isReachability:Bool {
    get {return _isReachability}
  }
  var reachabiltyNetworkType:String {
    get {return _reachabiltyNetworkType! }
  }


  // Create a shared instance of AppManager
  final  class var sharedInstance : AppManager {
    struct Static {
      static var instance : AppManager?
    }
    if !(Static.instance != nil) {
      Static.instance = AppManager()

    }
    return Static.instance!
  }

  // Reachability Methods--------------------------------------------------------------------------------//
  func initRechabilityMonitor() {
    print("initialize rechability...")
    do {
      let reachability = try Reachability.reachabilityForInternetConnection()
      self.reachability = reachability
    } catch ReachabilityError.FailedToCreateWithAddress(let address) {
      print("Unable to create\nReachability with address:\n\(address)")
      return
    } catch {}
    if (_useClosures) {
      reachability?.whenReachable = { reachability in
        self.notifyReachability(reachability: reachability)
      }
      reachability?.whenUnreachable = { reachability in
        self.notifyReachability(reachability: reachability)
      }
    } else {
        self.notifyReachability(reachability: reachability!)
    }

    do {
      try reachability?.startNotifier()
    } catch {
      print("unable to start notifier")
      return
    }


  }

  private func notifyReachability(reachability:Reachability) {
    if reachability.isReachable() {
      self._isReachability = true

      //Determine Network Type
      if reachability.isReachableViaWiFi() {
        print("Reachable WIFI")
        self._reachabiltyNetworkType = CONNECTION_NETWORK_TYPE.WIFI_NETWORK.rawValue
      } else {
        self._reachabiltyNetworkType = CONNECTION_NETWORK_TYPE.WWAN_NETWORK.rawValue
      }

    } else {
      self._isReachability = false
      self._reachabiltyNetworkType = CONNECTION_NETWORK_TYPE.OTHER.rawValue
    }

    NotificationCenter.default.addObserver(self, selector: "reachabilityChanged:", name: NSNotification.Name(rawValue: ReachabilityChangedNotification), object: reachability)
  }
  func reachabilityChanged(note: NSNotification) {
    let reachability = note.object as! Reachability
    DispatchQueue.main.async {
        self.delegate?.reachabilityStatusChangeHandler(reachability: reachability)

    }
  }
  deinit {
    reachability?.stopNotifier()
    if (!_useClosures) {
        NotificationCenter.defaultCenter.removeObserver(self, name: ReachabilityChangedNotification, object: nil)
    }
  }
}
