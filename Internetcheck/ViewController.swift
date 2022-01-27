//
//  ViewController.swift
//  Internetcheck
//
//  Created by Ankit Rana on 27/01/22.
//

import UIKit

class ViewController: UIViewController {
    let reachability = try! Reachability()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.reachability.whenReachable = { reachability in
                if reachability.connection == .wifi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
                self.view.window?.rootViewController?.dismiss(animated: true)
            }
            self.reachability.whenUnreachable = { _ in
                print("Not reachable")
                if let vc =  self.storyboard?.instantiateViewController(withIdentifier: "oppesViewController")as? oppesViewController
                {
                    self.present(vc, animated: true)
                }
                
            }

            do {
                try self.reachability.startNotifier()
            } catch {
                print("Unable to start notifier")
            }
        }
    }
deinit
{
    reachability.stopNotifier()
}
}

