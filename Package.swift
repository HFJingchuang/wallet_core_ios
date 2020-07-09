// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "wallet_core_ios",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(name: "WalletCoreIOS", targets: ["web3swift","chain3swift"])
    ],
  dependencies: [
    .package(url: "https://github.com/attaswift/BigInt.git", from: "3.1.0"),
    .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "0.12.0"),
    .package(url: "https://github.com/mxcl/PromiseKit.git", from: "6.4.0"),
    ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(name: "secp256k1"),
    .target(name: "keccak"),
    .target(name: "scrypt"),
    .target(
      name: "web3swift",
      dependencies: ["BigInt", "secp256k1", "keccak", "scrypt", "PromiseKit"],
      exclude: [
        "ObjectiveC",
        "Utils/EIP67Code.swift",
        "Migration-iOS.swift"
        ]),
    .target(
    name: "chain3swift",
    dependencies: ["BigInt", "CryptoSwift", "secp256k1", "PromiseKit"],
    exclude: [
      "ObjectiveC",
      "Utils/EIP67Code.swift",
      "Migration.swift"
      ]),
    .testTarget(
      name: "web3swiftTests",
      dependencies: ["web3swift","chain3swift"]),
    .testTarget(name: "WalletCoreIOSTests",dependencies: ["web3swift","chain3swift"])
    ]
)
