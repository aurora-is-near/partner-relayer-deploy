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

Updates
=======

Due to fast changing development on both NEAR and Aurora-Relayer, it is paramount to keep on track with changes.
Data releases and docker image releases are tightly synchronized. If you encounter any problems, it is likely by
using an outdated docker image. Just update the images to fix.

Furthermore the database will occasionally require updates. This is done automatically by the "resilver" container that will be started automatically when the docker-compose is started. During resilvering the indexer or endpoint may throw errors. Please check the docker-compose file(s) for more information.

Finding RPC endpoints
=====================

You can list the IP addresses assigned to the docker containers by running 

`
for machine in $(docker ps --format '{{.Names}}'); do echo "${machine}" $(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "${machine}" ) ; done
`

Please be aware that the endpoints are only listening to the assigned addresses.
