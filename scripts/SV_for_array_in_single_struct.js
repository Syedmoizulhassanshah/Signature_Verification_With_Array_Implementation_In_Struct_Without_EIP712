var Web3 = require('web3');
var web3 = new Web3();
require('dotenv').config();


const encode_value = web3.eth.abi.encodeParameter(
{

    "landData":{
         "ages": 'uint[]',
         "id": 'uint[]'
    }
},
{
    "ages": [1],
    "id": [2]

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
