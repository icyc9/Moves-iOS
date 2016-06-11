//
//  SendMoveViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/10/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxSwift
import RxCocoa

class SendMoveViewModel {
    private var moveService: MoveService
    private var createMoveState = BehaviorSubject<DarwinBoolean>(value: false)
    private var disposeBag = DisposeBag()
    
    init(moveService: MoveService) {
        self.moveService = moveService
    }
    
    func createMove(message: String, scope: String) {
        moveService.createMove(message, scope: scope)
            .subscribe(onNext: {moveCreatedSuccessfully in
                dispatch_async(dispatch_get_main_queue()) {
                    self.createMoveState.onNext(moveCreatedSuccessfully)
                }
            })
    }
}