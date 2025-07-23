const express = require("express");
const { mintoken } = require("./minttoken");

const app = express();

const wallet = "91oSDDBRG8fsivuEuFBtjZ6pk47xzA45PUjADaAQ6s7N";

const dumpres = { "nativeTransfers": [
     { "amount": 500000000, 
       "fromUserAccount": "devwuNsNYACyiEYxRNqMNseBpNnGfnd4ZwNHL7sphqv", 
       "toUserAccount": "91oSDDBRG8fsivuEuFBtjZ6pk47xzA45PUjADaAQ6s7N" 
    } ] }

app.post("/helius", async(req , res)=>{
    const incommingtrans = dumpres.nativeTransfers.find((x)=> x.toUserAccount===wallet)
    if(!incommingtrans){
        res.json({message:"do not have any transaction"})
        return;
    }
const fromaddress = incommingtrans.fromUserAccount ;
const toaddress =incommingtrans.toUserAccount;
const amount = incommingtrans.amount;

await mintoken(fromaddress , amount)


})

app.listen(3000, ()=>{
    console.log("running on port 3000");
})