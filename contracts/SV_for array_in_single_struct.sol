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

  

// struct
    struct LandData {
        uint[] ages;
        uint[] id;    
    }

  



   
    
  // modified  constructor
    constructor() ERC721("WRLDLand", "WRLD")
     {

     }

    






   function encode(LandData calldata _landData ) public view returns(bytes memory)  {
        
        return abi.encode(_landData);
    }

    function hashing(bytes memory encodedValue) public view returns (bytes32){
       return (keccak256(encodedValue));
   }   

  // Security
   function verifyOwnerSignature(bytes32 hash, bytes memory signature) public view returns(bool) {
    return hash.toEthSignedMessageHash().recover(signature) == owner();
  }



  

   


}  // end of contract
 
/* 

// Tuple
[[1],[2]]]


*/










