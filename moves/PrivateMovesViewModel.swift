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
    
    init(privateMoveService: PrivateMoveService) {
        self.privateMoveService = privateMoveService
    }
    
    func getPrivateMoves() -> Observable<Results<PrivateMoveModel>> {
        return Observable.just(privateMoveService.getPrivateMovesFromCache())
    }
}