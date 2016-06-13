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
    
    func getTimelineMovesFromCache() -> Results<TimelineMoveModel> {
        let realm = try! Realm()
        return realm.objects(TimelineMoveModel.self)
    }
    
    func getTimelineMovesFromAPI() -> Observable<Results<TimelineMoveModel>> {
        return restService.getUserMoves("open")
            .observeOn(MainScheduler.instance)
            .map({ (response, json) -> Results<TimelineMoveModel> in
                if response.statusCode == 200 {
                    // Success, update local cache
                    let realm = try! Realm()
                    
                    try realm.write {
                        // TODO: Convert API model into db models and insert
                    }
                }
                
                return self.getTimelineMovesFromCache()
            })
    }
}