Pod::Spec.new do |spec|
    spec.name         = 'walletcoreios'
    spec.version      = '0.0.3'
    spec.ios.deployment_target = "8.0"
    spec.osx.deployment_target = "10.10"
    spec.tvos.deployment_target = "9.0"
    spec.watchos.deployment_target = "2.0"
    spec.license      = 'MIT'
    spec.summary      = 'walletcoreios implementation in pure Swift for iOS, macOS, tvOS, watchOS and Linux'
    spec.homepage     = 'https://github.com/HFJingchuang/wallet_core_ios'
    spec.author       = 'MYXU'
    spec.source       = { :git => 'https://github.com/HFJingchuang/wallet_core_ios.git', :tag => spec.version }
    spec.source_files = 'Sources/walletcoreios/**/*.swift'
    spec.swift_version = '4.2'
    spec.dependency 'CryptoSwift', '~> 0.12'
    spec.dependency 'PromiseKit', '~> 6.4'
    spec.dependency 'BigInt', '~> 3.1'
    spec.dependency 'secp256k1.c', '~> 0.1'
    spec.dependency 'keccak.c', '~> 0.1'
    spec.dependency 'scrypt.c', '~> 0.1'
end
