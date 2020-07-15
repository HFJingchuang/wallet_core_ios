import XCTest
import BigInt

@testable import walletcoreios

final class WalletCoreIOSTests: XCTestCase {
    func testCreateAccount() {
        let mnemonics = Mnemonics()
        let keystore = try! BIP32Keystore(mnemonics: mnemonics)
        print(keystore.addresses[0])
        Web3.default.keystoreManager = KeystoreManager([keystore])
    }
    
    func testImportAccount() {
        let mnemonicsString = "nation tornado double since increase orchard tonight left drip talk sand mad"
        let mnemonics = try! Mnemonics(mnemonicsString)
        let keystore = try! BIP32Keystore(mnemonics: mnemonics)
        print(keystore.addresses)
        Web3.default.keystoreManager = KeystoreManager([keystore])
    }
    
}
