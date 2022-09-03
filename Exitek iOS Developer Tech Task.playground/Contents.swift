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


class StorageManager: MobileStorage {
    private var mobiles = Set<Mobile>()
    
    func getAll() -> Set<Mobile> {
        mobiles
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        mobiles.first(where: {$0.imei == imei})
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        mobiles.insert(mobile)
        return mobile
    }
    
    func delete(_ product: Mobile) throws {
        if mobiles.contains(product){
            mobiles.remove(product)
        }
    }
    
    func exists(_ product: Mobile) -> Bool {
        mobiles.contains(product)
        
    }
    
}


