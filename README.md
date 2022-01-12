Aurora Relayer & Near Core on mainnet
=====================================

Requirements: docker, docker-compose, curl. x64-64 architecture.

  1. Run `$ ./setup.sh`. Wait until it finishes with "Setup Complete". This can take hours due to the volume of data to download.
  2. Run `$ docker-compose up`
  3. Enjoy
 
Testnet
=======

Run `$ ./setup.sh testnet` to install a testnet instead of mainnet release.

Write transactions & custom signers
===================================

The default installation does not support write transactions. Instead it disables writing and sets up a placeholder key.

To enable write transactions, you need to:

  - Create an account on testnet/mainnet and load some NEAR on it.
  - Export the account's keypair and name into config/relayer.json (check the original file for format).
  - Change the `signer` entry in the config/testnet.yaml or config/mainnet.yaml to the account's name.
  - Set writable:true in config/testnet.yaml or config/mainnet.yaml.
  - Restart the endpoint container.
