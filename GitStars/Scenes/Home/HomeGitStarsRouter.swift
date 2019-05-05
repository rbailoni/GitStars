//
//  HomeGitStarsRouter.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

@objc protocol HomeGitStarsRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol HomeGitStarsDataPassing {
    var dataStore: HomeGitStarsDataStore? { get }
}

class HomeGitStarsRouter: NSObject, HomeGitStarsRoutingLogic, HomeGitStarsDataPassing {
    weak var viewController: HomeGitStarsViewController?
    var dataStore: HomeGitStarsDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: HomeGitStarsViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: HomeGitStarsDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
