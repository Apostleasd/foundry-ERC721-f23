//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployMoodNft;
    function setUp() public {
        deployMoodNft = new DeployMoodNft();
    }

    function testSvgToUri() public {
        string memory svg = "<svg></svg>";
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2Zz48L3N2Zz4=";
        string memory actualUri = deployMoodNft.svgToImageUri(svg);
        assertEq(actualUri, expectedUri);
    }
}
