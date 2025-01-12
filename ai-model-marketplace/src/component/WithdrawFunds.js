import React from "react";
import contract from "../utils/contract.js";

function WithdrawFunds({ account }) {
  const withdrawFunds = async () => {
    try {
      await contract.methods.withdrawFunds().send({ from: account });
      alert("Funds withdrawn successfully!");
    } catch (error) {
      alert("Error withdrawing funds.");
      console.error(error);
    }
  };

  return (
    <div>
      <h2>Withdraw Funds</h2>
      <button onClick={withdrawFunds}>Withdraw</button>
    </div>
  );
}

export default WithdrawFunds;
