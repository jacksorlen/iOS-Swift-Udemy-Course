//protocol AdvancedLifeSupport {
//
//    func performCPR()
//}
//
//class EmergencyCallHandler {
//
//    var delegate: AdvancedLifeSupport?
//
//    func assessSituation() {
//        print("Can you tell me what happened?")
//    }
//
//    func medicalEmergency() {
//        delegate?.performCPR()
//    }
//}
//
//struct Paramedic: AdvancedLifeSupport {
//
//    init(handler: EmergencyCallHandler) {
//        handler.delegate = self
//    }
//
//    func performCPR() {
//        print("Paramedic works!")
//    }
//}
//
//let emilie = EmergencyCallHandler()
//let pite = Paramedic(handler: emilie)
//
//emilie.medicalEmergency()

let array = [5, 3, 1, 9, 5, 0]

let newArr = array.map() { $0 + 1 }
 
print(newArr)


