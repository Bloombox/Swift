//
//  ViewController.swift
//  Example
//
//  Created by Sam Gammon on 10/14/18.
//  Copyright © 2018 Sam Gammon. All rights reserved.
//

import UIKit
import OpenCannabis
import Bloombox


class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let x = try? self.setupAndTryService()
    print("did try service")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  private func setupAndTryService() throws -> Empty {
    let client = Bloombox(settings: Bloombox.Settings(
      apiKey: "AIzaSyDOO0IJPslZhmMMKRSH5nrR9oTlcOlgSWU",
      partner: "abatin",
      location: "sacramento"))

    let resp = try client.platform.healthcheck()
    return resp
  }

}
