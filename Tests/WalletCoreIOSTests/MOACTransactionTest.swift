//
//  File.swift
//  
//
//  Created by jch01 on 2020/7/9.
//
import XCTest
import BigInt
import Foundation

@testable import walletcoreios

final class MOACTransactionTest: XCTestCase {
    func testTransaction() throws {
        do {
            var transaction = MOACTransaction(nonce: 9,
                                                  gasPrice: 20_000_000_000,
                                                  gasLimit: 21000,
                                                  to: "0x3535353535353535353535353535353535353536",
                                                  value: "1000000000000000000",
                                                  data: Data(),
                                                  v: 0,
                                                  r: "",
                                                  s: 0,
                                                  systemContract: 0,
                                                  shardingFlag: 0)
            let privateKeyData = Data.fromHex("0x4646464646464646464646464646464646464646464646464646464646464646")!
            let publicKey = try Web3Utils.privateToPublic(privateKeyData, compressed: false)
            let sender = try Web3Utils.publicToAddress(publicKey)
            transaction.chainID = 1
            let hash = transaction.hashForSignature(chainID: 1)
            print("1:" + hash!.hex)
            let expectedHash = "0x619daa827646953af4346c58d896b79ad0ba7d9223ca8515d6b1078fc1a107cc".withoutHex
            XCTAssert(hash!.hex == expectedHash, "Transaction signature failed")
            try Chain3Signer.EIP155Signer.sign(transaction: &transaction, privateKey: privateKeyData, useExtraEntropy: false)
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

