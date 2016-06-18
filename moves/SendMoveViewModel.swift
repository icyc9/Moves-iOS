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
    
    init(privateMoveService: PrivateMoveService, moveTimelineService: MoveTimelineService, friendService: FriendService) {
        self.privateMoveService = privateMoveService
        self.friendService = friendService
        self.moveTimelineService = moveTimelineService
    }
    
    func invalidateFriendsCache() -> Observable<Results<UserModel>> {
        return friendService.getUserFriendsFromAPI()
            .observeOn(MainScheduler.instance)
    }
    
    func getFriendsFromCache() -> Observable<Results<UserModel>>{
        // Load and show from cache
        return Observable.just(friendService.getUserFriendsFromCache())
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