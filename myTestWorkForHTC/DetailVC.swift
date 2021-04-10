import UIKit
import CoreData


class DetailVC: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var userMarkTF: UITextField!
    
    
    
    
    var selectedStudent: StudentModel? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectedStudent != nil){
            userMarkTF.text = selectedStudent?.userMark
            firstNameTF.text = selectedStudent?.firstName
            lastNameTF.text = selectedStudent?.lastName
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedStudent == nil) {
            let entity = NSEntityDescription.entity(forEntityName: "StudentModel", in: context)
            let newStudent = StudentModel(entity: entity!, insertInto: context)
            newStudent.id = studentList.count as NSNumber
            newStudent.firstName = firstNameTF.text
            newStudent.userMark = userMarkTF.text
            newStudent.lastName = lastNameTF.text
            do{
               try  context.save()
                studentList.append(newStudent)
                navigationController?.popViewController(animated: true)
            }
            catch {
                
            }
        } else
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentModel")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let student = result as! StudentModel
                    if(student == selectedStudent) {
                        student.firstName = firstNameTF.text
                        student.lastName = lastNameTF.text
                        student.userMark = userMarkTF.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            }
            catch {
                
            }
        }
        
    }
    
}

