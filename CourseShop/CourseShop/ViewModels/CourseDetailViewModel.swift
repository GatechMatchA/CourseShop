//
//  CourseDetailViewModel.swift
//  CourseShop
//
//  Created by Rahil Patel on 2/14/20.
//  Copyright © 2020 MatchA. All rights reserved.
//

import Foundation

class CourseDetailViewModel: ObservableObject {
    @Published var courseDetails: CourseDetails = Constants.placeholderCourseDetails
    
    func loadCourseDetails(for course: Course, onComplete: @escaping () -> Void) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.courseDetails = Constants.sampleCourseDetails
//            onComplete()
//        }
        let courseReq = CourseRequest()
        courseReq.getCourseData(for: course, onSuccess: { (details) in
            DispatchQueue.main.async {
                self.courseDetails = details
                onComplete()
            }
        }) { (error) in
            print(error)
        }
    }
}
