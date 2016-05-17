//
//  dataStruct.swift
//  SwivelMobile
//
// Singleton data structure to store the expensive one time Request
//
//  Created by Jonathen Chen on 2016-05-05.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import Foundation
import Alamofire

class Package {
    static var sharedInstance = Package()
    private init() {}

    //JSON DATA
    var data: JSON?
    var url = "http://localhost:8080/api/" //"http://52.39.216.194/"
    var type = "students"
    var id = 30
    var courses: [String] = []
    var grades: [Int] = []
    var average: Double? = 0
    var announcements: [[String]] = []
    var assignments: [[String]] = []
    //Formatted data

    //Methods
    func calculateAverage() {
        var sum: Double? = 0
        for (_, subJson) in self.data!["courses"] {
            sum! += subJson["grade"].double!
        }
        self.average = sum! / Double(self.data!["courses"].count)
    }

    func arrayifyCourses() {
        var temp: [String] = []
        var tempGrades: [Int] = []

        for (_, subJson) in self.data!["courses"] {
            temp.append(subJson["name"].string!)
            tempGrades.append(subJson["grade"].int!)
        }

        self.courses = temp
        self.grades = tempGrades
    }

    func arrayifyAnnouncements() {
        var temp: [[String]] = []
        for (_, courses) in self.data!["courses"] {
            for (_, announcement) in courses["announcements"] {
                temp.append([announcement["title"].string!, announcement["body"].string!])
            }
        }
        self.announcements = temp
    }

    func arrayifyAssignments() {
        var temp: [[String]] = []
        for (_, courses) in self.data!["courses"] {
            for (_, assignments) in courses["assignments"] {
                temp.append([assignments["name"].string!, assignments["dueDate"].string!, String(assignments["weight"].int!), courses["name"].string!])
            }
        }
        self.assignments = temp
    }

    //Built in Update Method
    func update() {
      Alamofire.request(.GET,url + type + "/" +  String(id))
            .response { (request, response, data, error) in
                self.data = JSON(data: data!)
                self.arrayifyCourses()
                self.calculateAverage()
                self.arrayifyAnnouncements()
                self.arrayifyAssignments()
            }

    }
}

