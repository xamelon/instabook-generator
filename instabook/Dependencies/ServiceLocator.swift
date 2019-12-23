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
        c.register(CarouselRouterInput.self, factory: {_ in CarouselRouter()})
        
        c.register(SinglePostViewInput.self, factory: { _ in SinglePostViewController() } )
        c.register(SinglePostRouterInput.self, factory: { _ in SinglePostRouter() } )
        c.register(SinglePostViewOutput.self, factory: { _ in SinglePostPresenter() })
    }
    
    static func getCarousel() -> CarouselViewInput {
        let model = c.resolve(CarouselModelInput.self) as? CarouselModel
        let viewController = c.resolve(CarouselViewInput.self) as? CarouselViewController
        let presenter = c.resolve(CarouselViewOutput.self) as? CarouselPresenter
        let router = c.resolve(CarouselRouterInput.self) as? CarouselRouter
        
        presenter?.model = model
        presenter?.view = viewController
        viewController?.presenter = presenter
        router?.view = viewController
        
        return viewController!
    }
    
    static func getSinglePost() -> SinglePostViewController {
        let presenter = c.resolve(SinglePostViewOutput.self) as? SinglePostPresenter
        let view = c.resolve(SinglePostViewInput.self) as? SinglePostViewController
        let router = c.resolve(SinglePostRouterInput.self) as? SinglePostRouter
        
        presenter?.router = router
        presenter?.view = view
        router?.view = view
        view?.output = presenter
        
        return view!
    }

}
