import web3 from "./web3";
import AIModelMarketplace from "./AIModelMarketplace.json";

const address = "0x3246e44205BEd5C39c5d51a53fc1039d8b02fb38";
const abi = AIModelMarketplace.abi;

const contract = new web3.eth.Contract(abi, address);
export default contract;
