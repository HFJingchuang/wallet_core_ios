//
//  File.swift
//  
//
//  Created by jch01 on 2020/7/9.
//

import XCTest
import BigInt

@testable import web3swift

final class ETHTransactionTest: XCTestCase {
    func testTransaction() throws {
        do {
            var transaction = EthereumTransaction(nonce: 9,
                                                  gasPrice: 20_000_000_000,
                                                  gasLimit: 21000,
                                                  to: "0x3535353535353535353535353535353535353535",
                                                  value: "1000000000000000000",
                                                  data: Data(),
                                                  v: 0,
                                                  r: 0,
                                                  s: 0)
            let privateKeyData = Data.fromHex("0x4646464646464646464646464646464646464646464646464646464646464646")!
            let publicKey = try Web3Utils.privateToPublic(privateKeyData, compressed: false)
            let sender = try Web3Utils.publicToAddress(publicKey)
            transaction.chainID = 1
            print(transaction)
            let hash = transaction.hashForSignature(chainID: 1)
            let expectedHash = "0xdaf5a779ae972f972197303d7b574746c7ef83eadac0f2791ad23db92e4c8e53".withoutHex
            XCTAssert(hash!.hex == expectedHash, "Transaction signature failed")
            try Web3Signer.EIP155Signer.sign(transaction: &transaction, privateKey: privateKeyData, useExtraEntropy: false)
            print(transaction)
            XCTAssert(transaction.v == 37, "Transaction signature failed")
            XCTAssert(sender == transaction.sender)
            guard transaction.sender != nil else { return }
            guard let encodedData = transaction.encode() else { return }
            let hex = encodedData.toHexString().withHex.lowercased()
            let params = [hex] as Array<Encodable>
            print(params[0])
        } catch {
            print(error)
            XCTFail()
        }
    }
    
}
