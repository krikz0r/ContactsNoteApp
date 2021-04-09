import CoreData

@objc(StudentModel)
class StudentModel :NSManagedObject {
    @NSManaged var id: NSNumber!
    @NSManaged var userMark: String!
    @NSManaged var userName: String!
}
