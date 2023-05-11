
# Delete existing artifacts
rm genesis.block mychannel.tx
rm -rf ../../channel-artifacts/*

#Generate Crypto artifactes for organizations
# cryptogen generate --config=./crypto-config.yaml --output=./crypto-config/



# System channel
SYS_CHANNEL="sys-channel"

# channel name defaults to "mychannel"
CHANNEL_NAME="mychannel"

echo $CHANNEL_NAME

# Generate System Genesis block
configtxgen -profile OrdererGenesis -configPath . -channelID $SYS_CHANNEL  -outputBlock ./genesis.block


# Generate channel configuration block
configtxgen -profile BasicChannel -configPath . -outputCreateChannelTx ./$CHANNEL_NAME.tx -channelID $CHANNEL_NAME

echo "#######    Generating anchor peer update for Org1MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

echo "#######    Generating anchor peer update for Org2MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP

echo "#######    Generating anchor peer update for Org3MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Org3MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org3MSP

####
rm org1-org2-channel.tx
rm -rf ../../channel-artifacts/org1-org2-channel.block

# channel name defaults to "mychannel"
CHANNEL_NAME="org1-org2-channel"

echo $CHANNEL_NAME

# Generate channel configuration block
configtxgen -profile org1-org2-channel -configPath . -outputCreateChannelTx ./org1-org2-channel.tx -channelID $CHANNEL_NAME

echo "#######    Generating anchor peer update for Org1MSP  ##########"
configtxgen -profile org1-org2-channel -configPath . -outputAnchorPeersUpdate ./Org1MSPanchors_.tx -channelID $CHANNEL_NAME -asOrg Org1MSP


echo "#######    Generating anchor peer update for Org2MSP  ##########"
configtxgen -profile org1-org2-channel -configPath . -outputAnchorPeersUpdate ./Org2MSPanchors_.tx -channelID $CHANNEL_NAME -asOrg Org2MSP
