//
//  ServiceLocator.swift
//  instabook
//
//  Created by Body Block on 24/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import Swinject

struct ServiceLocator {
    static let c = Container()
    
    static func registerModules() {
        c.register(CarouselViewInput.self, factory: { _ in CarouselViewController() } )
        c.register(CarouselModelInput.self, factory: { _ in CarouselModel() } )
        c.register(CarouselViewOutput.self, factory: { _ in CarouselPresenter() } )
        
    }
    
    static func getCarousel() -> CarouselViewInput {
        let model = c.resolve(CarouselModelInput.self) as? CarouselModel
        let viewController = c.resolve(CarouselViewInput.self) as? CarouselViewController
        let presenter = c.resolve(CarouselViewOutput.self) as? CarouselPresenter
        
        presenter?.model = model
        presenter?.view = viewController
        viewController?.presenter = presenter
        
        return viewController!
    }

}
