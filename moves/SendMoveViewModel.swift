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
    private var privateMoveService: PrivateMoveService
    private var moveTimelineService: MoveTimelineService
    private var friendService: FriendService
    var createMoveState = BehaviorSubject<DarwinBoolean>(value: false)
    var friends = PublishSubject<Results<UserModel>>()
    private var disposeBag = DisposeBag()
    
    init(privateMoveService: PrivateMoveService, moveTimelineService: MoveTimelineService, friendService: FriendService) {
        self.privateMoveService = privateMoveService
        self.friendService = friendService
        self.moveTimelineService = moveTimelineService
    }
    
    func getFriends() {
        friendService.getUserFriends()
            .subscribe(onNext: { friends in
                dispatch_async(dispatch_get_main_queue()) {
                    self.friends.onNext(friends)
                }
            }).addDisposableTo(disposeBag)
    }
    
    func createMove(message: String, scope: String) {
//        moveService.createMove(message, scope: scope)
//            .subscribe(onNext: {moveCreatedSuccessfully in
//                dispatch_async(dispatch_get_main_queue()) {
//                    self.createMoveState.onNext(moveCreatedSuccessfully)
//                }
//            }).addDisposableTo(disposeBag)
    }
}