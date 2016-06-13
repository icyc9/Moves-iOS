//
//  PrivateMovesViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/12/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxSwift
import RxCocoa
import RealmSwift

class PrivateMovesViewModel {
    private var privateMoveService: PrivateMoveService
    private var disposeBag = DisposeBag()
    
    var moves = PublishSubject<Results<PrivateMoveModel>>()
    
    init(privateMoveService: PrivateMoveService) {
        self.privateMoveService = privateMoveService
        moves.addDisposableTo(disposeBag)
    }
    
    func getPrivateMoves() {
        dispatch_async(dispatch_get_main_queue()) {
            self.moves.onNext(self.privateMoveService.getPrivateMovesTimelineFromCache())
        }
    }
}