//
//  DataService  .swift
//  Widget_TashamsExtension
//
//  Created by Samaa on 01/04/1445 AH.
//

import Foundation
import SwiftUI
 

struct DataService{
    @AppStorage ("Streak",store: UserDefaults(suiteName: "group.com.tashmas.widget03 ")) var Streak  = 0
    func log(){
        Streak += 1
    }
    func progress() -> Int{
        return Streak
    }
}

