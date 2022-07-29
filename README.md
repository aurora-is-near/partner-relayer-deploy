Aurora Relayer & Near Core on mainnet
=====================================

Requirements: docker, docker-compose, curl. x64-64 architecture.

  1. Run `$ ./setup.sh`. Wait until it finishes with "Setup Complete". This can take hours due to the volume of data to download.
  2. Enjoy
 
Testnet
=======

Run `$ ./setup.sh testnet` to install a testnet instead of mainnet release.

Starting & Stopping
===================

When running `./setup.sh` you should end up with a running node that is catching up with the network.
You can always stop and start the node by executing the `./stop.sh` or `./start.sh` command.


Write transactions & custom signers
===================================

The default installation does not support write transactions. Instead it disables writing and sets up a placeholder key.

To enable write transactions, you need to:

  - Create an account on testnet/mainnet and load some NEAR on it.
  - Export the account's keypair and name into config/relayer.json (check the original file for format).
  - Change the `signer` entry in the config/testnet.yaml or config/mainnet.yaml to the account's name.
  - Set writable:true in config/testnet.yaml or config/mainnet.yaml.
  - Restart the endpoint container.

Updates
=======

The software in this installation is updated automatically. Whenever Aurora releases a new image, it will be
downloaded, and the component restarted.

This is however not true for the included database and chain files. These are only downloaded initially when
running `./setup.sh`. Keep your node running to prevent going out of sync.

Finding RPC endpoint
====================

The RPC endpoint is at http://127.0.0.1:10080/ as well as on the public IPs of your computer.

Good to know
============

  - You can change the setup of the nginx reverse proxy by editing the contrib/nginx/<network>/endpoint.conf files. Restart the node afterwards.
  - You can prevent listening on the public IP by modifying the docker-compose.yaml file. See embedded comments.

