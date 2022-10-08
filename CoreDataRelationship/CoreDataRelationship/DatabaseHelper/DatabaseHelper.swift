import Foundation
import CoreData
import UIKit

enum EntityType {
    case college, student
    var entityName: String {
        switch self {
        case .college: return "College"
        case .student: return "Student"
        }
    }
}

class DatabaseHelper: NSObject {
    override init() { }
    static let sharedObject = DatabaseHelper()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveCollege(collegeDict: [String: Any]) {
        let collegeobject = NSEntityDescription.insertNewObject(forEntityName: EntityType.college.entityName, into: context) as? College
        collegeobject?.name = collegeDict["collegeName"] as? String
        collegeobject?.address = collegeDict["collegeAddress"] as? String
        collegeobject?.city = collegeDict["collegeCity"] as? String
        collegeobject?.university = collegeDict["collegeUniversity"] as? String
        do {
            try context.save()
        } catch {
            debugPrint("Failed to save data")
        }
    }
    
    func getcollegeList() -> [College] {
        var collegeList: [College] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: EntityType.college.entityName)
        do {
            collegeList = try context.fetch(fetchRequest) as! [College]
        } catch {
            debugPrint("Failed to fetch colleges")
        }
        return collegeList
    }
    
    func deleteCollege(index: Int) -> [College]{
        var arrCollegeList = getcollegeList()
        context.delete(arrCollegeList[index])
        arrCollegeList.remove(at: index)
        return arrCollegeList
    }
    
    func saveStudent(dict: [String: Any], college: College?) {
        let studentObject = NSEntityDescription.insertNewObject(forEntityName: EntityType.student.entityName, into: context) as? Student
        studentObject?.name = dict["studentName"] as? String
        studentObject?.address = dict["studentCity"] as? String
        studentObject?.phone = dict["studentPhone"] as? String
        studentObject?.universities = college
        do {
            try context.save()
        } catch {
            debugPrint("Failed to save data")
        }
    }
    
    func getStudentList() -> [Student] {
        var studentList: [Student] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: EntityType.student.entityName)
        do {
            studentList = try context.fetch(fetchRequest) as! [Student]
        } catch {
            debugPrint("Failed to fetch colleges")
        }
        return studentList
    }
    
    func deleteStudent(index: Int) -> [Student]{
        var arrStudentList = getStudentList()
        context.delete(arrStudentList[index])
        arrStudentList.remove(at: index)
        return arrStudentList
    }
}
