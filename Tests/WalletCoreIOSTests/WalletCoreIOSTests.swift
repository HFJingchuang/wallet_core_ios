import XCTest
import BigInt

@testable import chain3swift
@testable import web3swift

final class WalletCoreIOSTests: XCTestCase {
    func testCreateAccount() {
        let mnemonics = web3swift.Mnemonics()
        let keystore = try! BIP32Keystore(mnemonics: mnemonics)
        print(keystore.addresses[0])
        Web3.default.keystoreManager = web3swift.KeystoreManager([keystore])
    }
    
    func testImportAccount() {
        let mnemonicsString = "nation tornado double since increase orchard tonight left drip talk sand mad"
        let mnemonics = try! web3swift.Mnemonics(mnemonicsString)
        let keystore = try! BIP32Keystore(mnemonics: mnemonics)
        print(keystore.addresses)
        Web3.default.keystoreManager = web3swift.KeystoreManager([keystore])
    }
    
    func testGetBalance() throws {
        let mnemonicsString = "nation tornado double since increase orchard tonight left drip talk sand mad"
        let mnemonics = try! chain3swift.Mnemonics(mnemonicsString)
        let keystore = try! BIP32Keystore(mnemonics: mnemonics)
        print(keystore.addresses[0])
        Chain3.default.keystoreManager = chain3swift.KeystoreManager([keystore])
    }
    
    func testGetAccounts() throws {
        let mnemonics = chain3swift.Mnemonics()
        let keystore = try! BIP32Keystore(mnemonics: mnemonics)
        print(keystore.addresses[0])
        Chain3.default.keystoreManager = chain3swift.KeystoreManager([keystore])
    }
}
