//
//  MoveTimelineService.swift
//  moves
//
//  Created by Daniel Christopher on 6/12/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxSwift
import RxCocoa
import RealmSwift

class MoveTimelineService {
    private var restService: RestService
    
    init(restService: RestService) {
        self.restService = restService
    }
    
    //    func declineJoinMoveRequest() -> Observable<DarwinBoolean> {
    //
    //    }
    
    //    func acceptJoinMoveRequest() -> Observable<DarwinBoolean> {
    //
    //    }
    
    
    func getFriendMovesTimeline() -> Observable<Results<PrivateMoveModel>> {
        return restService.getUserMoves("open")
            .map({ (response, json) -> Result<MoveModel> in
                
            })
    }
}