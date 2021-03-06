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
        
        c.register(PostSettingsPanelViewInput.self, factory: { _ in PostSettingsPanelViewController()} )
        c.register(PostSettingsPanelViewOutput.self, factory: { _ in PostSettingsPanelPresenter() } )
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
        presenter?.router = router
        
        return viewController!
    }
    
    static func getSinglePost(withPost post: Post) -> SinglePostViewController {
        let presenter = c.resolve(SinglePostViewOutput.self) as? SinglePostPresenter
        let view = c.resolve(SinglePostViewInput.self) as? SinglePostViewController
        let router = c.resolve(SinglePostRouterInput.self) as? SinglePostRouter
        
        view?.modalPresentationStyle = .fullScreen
        presenter?.router = router
        presenter?.view = view
        presenter?.post = post
        router?.view = view
        view?.output = presenter
        
        return view!
    }
    
    static func getPostPanelSettings(withPostPanelSettingsOutput postPanelSettingsOutput: PostSettingsPanelModuleOutput) -> PostSettingsPanelViewController {
        let presenter = c.resolve(PostSettingsPanelViewOutput.self) as? PostSettingsPanelPresenter
        let view = c.resolve(PostSettingsPanelViewInput.self) as? PostSettingsPanelViewController
        
        presenter?.output = postPanelSettingsOutput
        presenter?.view = view
        view?.output = presenter
        
        return view!
    }

}
