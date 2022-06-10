# Signature_Verification_With_Array_Implementation_In_Struct_Without_EIP712
 
**Note:** The instructions given below are for Ubuntu 20.04 LTS (users only).

## Steps to run the project

1. Clone the repository.
2. Install the dependencies using the following command `npm i` and `npm install dotenv --save`
3. Create a `.env` file in the project folder and add your `PRIVATEKEY`  in it. 
4. Run the signature creation scripts present in the script folder.
5. Copy the contract present in the contracts folder and deploy it on remix using your wallet address whose privatekey you used for creating     
   signature off-chain. 
7. Then call the `encode()` function by passing the mintData **tuple**. 
8. After this call the `hashing()` function by passing the encoded mintData **tuple** that was returned from the`encode()` function.
9. Lastly pass the **hash** returned after calling the `hashing()` function along with the **signature** (value) you created off-chain. 
10. **Result:** Signature is verified.


## Off-Chain

Node.js v16.13.2 or later

### Steps

1. Here, we are using **web3.js library** for creating off-chain signature.Use the following command to install **web3** `npm install web3`

2. Then we are using `web3.eth.abi.encodeParameter()` method for encoding our struct-type data before hashing it.This method returns a **hexString** as an output. 

3. Once the data is encoded, we **hash** it by using `web3.utils.keccak256()` method.We pass the encoded **hexString** into `web3.utils.keccak256()` method to obtain the hash of struct-type data.This `web3.utils.keccak256()` method returns a **hexString** as an output too.

4. Now, once we get the **hash** of our struct-type data, we pass this **hash** into the `web3.eth.accounts.sign()` along with our **privateKey**, to create a signature off-chain.This `web3.eth.accounts.sign()` method returns a **hexString** as an output as well.This **signature** is passed into the `mintSingleLand()` method present in the Land-contract along with our mintData **tuple** for signature verification.

5. In-order to get the signer address with which we have created the signature off-chain we are using `web3.eth.accounts.recover()` method.We pass the **hash** of the struct-type data along with **signature** that we created to get the required signer address.This signer address should be equal to the  address returned by `recover()` method present in ECDSA library else you have created a wrong signature. 


## On-Chain


### Steps
1. In-order to perform the signature verification , we first deploy the smart-contract with the same  wallet address whose privatekey we used for creating the signature off-chain.

2. When the contract is deployed we call the `encode()` method present in it contract by passing  mintData **tuple**.It returns a **bytes** string.

3. Then we call  `hashing()` method by passing the **bytes** string returned from `encode()` function.This `hashing` method returns a **bytes32** hashed string.

4. The **bytes32** hashed string returned by `hashing()` function along with the **signature** (value) that we created off-chain is passed into the
`verifyOwnerSignature()`.

5. The `verifyOwnerSignature()` takes the **hash** of the mintData **tuple** along with **signature**, this **hash** of the mintData **tuple** is passed into the `toEthSignedMessageHash()` method present in ECDSA library.`toEthSignedMessageHash()` method returns an **Ethereum Signed Message** which is also `bytes32` type **hash**.

6. The ``bytes32`` type **hash** returned by `toEthSignedMessageHash()` method is further passed into `recover()` method present in ECDSA library along with the signature.This `recover()` method returns the signer address.

7. we now compare the signer address returned by `recover()` method with the owner of the contract using `owner()` method.If both the addresses are same then `verifyOwnerSignature()` will return a `true` value thus, the siganture verified.Else, if the `verifyOwnerSignature()` return a `false` value then the signature is not verified,showing an error **Invalid Signature** in the pop-up and also in the console.
<<<<<<< HEAD

=======
>>>>>>> 8b60797bef6b8e710a0ae69da4ef54813eac0ee2
