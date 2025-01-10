import Web3 from "web3";

let web3;
if (window.ethereum) {
    web3 = new Web3(window.ethereum);
    window.ethereum.request({ method: "eth_requestAccounts" });
} else {
    console.error("Metamask not detected");
}

export default web3;
