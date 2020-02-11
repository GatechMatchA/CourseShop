//
//  Constants.swift
//  CourseShop
//
//  Created by Rahil Patel on 2/11/20.
//  Copyright © 2020 MatchA. All rights reserved.
//

import Foundation

struct Constants {
    static var testCourses = [
        Course(courseNum: "CS 1331", courseName: "Introduction to Object Oriented Programming", numCredits: 3, selectedSection: Constants.sampleSection),
        Course(courseNum: "CS 1332", courseName: "Data Structures and Algorithms", numCredits: 3),
        Course(courseNum: "CS 2050", courseName: "Introduction to Discrete Math", numCredits: 3),
        Course(courseNum: "CS 3451", courseName: "Computer Graphics", numCredits: 3)
    ]
    
    static var sampleCourse = Course(courseNum: "CS 1331", courseName: "Introduction to Object Oriented Programming", numCredits: 3)
    
    static var sampleSection = Section(professor: "Christopher Simpkins", letter: "A", avgGPA: 3.2, easiness: 4.5, quality: 4.9)
}