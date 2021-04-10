import CoreData

@objc(StudentModel)
class StudentModel :NSManagedObject,Encodable {
    @NSManaged var id: NSNumber!
    @NSManaged var userMark: String!
    @NSManaged var firstName: String!
    @NSManaged var lastName: String!
}

