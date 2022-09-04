import Foundation

protocol MobileStorage {
    func getAll() ->Set<Mobile>
    func findByImei(_ imei: String) ->Mobile?
    func save(_ mobile: Mobile) throws ->Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

struct Mobile: Hashable {
    let imei: String
    let model: String
}

enum MobileStorageError: Error {
    case notPhoneInMemory
    case thisPhoneAlreadyExists
}

class StorageManager: MobileStorage {
    private var mobiles = Set<Mobile>()
    
    func getAll() -> Set<Mobile> {
        mobiles
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        mobiles.first(where: {$0.imei == imei})
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        if mobiles.contains(mobile) {
            throw MobileStorageError.thisPhoneAlreadyExists
        }else{
            mobiles.insert(mobile)
            return mobile
        }
        
    }
    
    func delete(_ product: Mobile) throws {
        if mobiles.contains(product){
            mobiles.remove(product)
        }else{
            throw MobileStorageError.notPhoneInMemory
        }
    }
    
    func exists(_ product: Mobile) -> Bool {
        mobiles.contains(product)
        
    }
    
}


