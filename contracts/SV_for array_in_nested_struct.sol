// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract WRLDLand1 is ERC721Enumerable, Ownable, ReentrancyGuard 
{
    using SafeMath for uint256;
    using ECDSA for bytes32;

  


// Array in structs

   
    struct LandData {
        uint[] ages;
        uint[] id;    
    }

    struct MintData {
        uint256 _tokenId;
        string _tokenMetadataHash;
        LandData _landData;
    }


    constructor() ERC721("WRLDLand", "WRLD") {
    }

    

  // Security
   function verifyOwnerSignature(bytes32 hash, bytes memory signature) public view returns(bool) {
    return hash.toEthSignedMessageHash().recover(signature) == owner();
  }



  function encode(MintData calldata _mintData ) public view returns(bytes memory)  {
        
        return abi.encode(_mintData);
    }

   function hashing(bytes memory encodedValue) public view returns (bytes32){
       return (keccak256(encodedValue));
   }    


}  // end of contract
 

/* 

tuple
[1,"QmT757cQUpNSNaEyDYYv5No7GzRogF3bnTGYxRS98EMcwt",[[1],[2]]]


*/






