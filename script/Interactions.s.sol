//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    function run() external {
        vm.allowCheatcodes(address(this));
        address contractAddress = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(contractAddress);
    }

    function mintNftOnContract(address _contractAddress) private {
        vm.startBroadcast();
        BasicNft(_contractAddress).mintNft(
            "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json"
        );
        vm.stopBroadcast();
    }
}
