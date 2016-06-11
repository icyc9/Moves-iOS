//
//  SendMoveViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/10/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxSwift
import RxCocoa
import RealmSwift

class SendMoveViewModel {
    private var moveService: MoveService
    private var userService: UserService
    var createMoveState = BehaviorSubject<DarwinBoolean>(value: false)
    var friends = PublishSubject<Results<UserModel>>()
    private var disposeBag = DisposeBag()
    
    init(moveService: MoveService, userService: UserService) {
        self.moveService = moveService
        self.userService = userService
    }
    
    func getFriends() {
        userService.getUserFriends()
            .subscribe(onNext: { friends in
                dispatch_async(dispatch_get_main_queue()) {
                    self.friends.onNext(friends)
                }
            }).addDisposableTo(disposeBag)
    }
    
    func createMove(message: String, scope: String) {
        moveService.createMove(message, scope: scope)
            .subscribe(onNext: {moveCreatedSuccessfully in
                dispatch_async(dispatch_get_main_queue()) {
                    self.createMoveState.onNext(moveCreatedSuccessfully)
                }
            }).addDisposableTo(disposeBag)
    }
}