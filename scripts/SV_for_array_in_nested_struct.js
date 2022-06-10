var Web3 = require('web3');
var web3 = new Web3();
require('dotenv').config();



const encode_value = web3.eth.abi.encodeParameter(
{
    "MintData":{
        "_tokenId": 'uint256',
        "_tokenMetadataHash":'string',
    "LandData":{
         "ages": 'uint[]',
         "id": 'uint[]'
     } // end of single Struct
  } // end of Nested Struct
},
{  "_tokenId": 1,
   "_tokenMetadataHash":'QmT757cQUpNSNaEyDYYv5No7GzRogF3bnTGYxRS98EMcwt',
   "LandData":{
              "ages": [1],
              "id": [2]
               } 
}
);

const privateKey = process.env.PRIVATEKEY;
const structHash = web3.utils.keccak256(encode_value);
//const hashGettingFromECDSAAfterPassingTheStructHash = web3.eth.accounts.hashMessage(structHash);
const signature = web3.eth.accounts.sign(structHash, privateKey);
const signerAddress = web3.eth.accounts.recover(structHash, signature.signature);


console.log("This is the abi.encode value similar to on chain:", encode_value);
console.log("\nThis is the structHash value similar to on chain:", structHash);
//console.log("\nThis is the Hash value similar to the one the ECDSA toEth returns:", hashGettingFromECDSAAfterPassingTheStructHash);
console.log("\nThe require signature is :",signature.signature);
console.log("\nThis is the required signature address :",signerAddress);

