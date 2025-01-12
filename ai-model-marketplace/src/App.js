import logo from './logo.svg';
import React, { useState, useEffect } from "react";
import ListModel from "./components/ListModel.js";
import ViewModels from "./components/ViewModels.js";
import WithdrawFunds from "./components/WithdrawFunds.js";
import web3 from "./utils/web3.js";
import "./App.css";

function App() {
  const [account, setAccount] = useState("");

  useEffect(() => {
    async function loadAccount() {
      try {
        const accounts = await web3.eth.getAccounts();
        setAccount(accounts[0]);
      } catch (error) {
        console.error("Failed to load account", error);
      }
    }
    loadAccount();
  }, []);

  return (
    <div className="App">
      <h1>AI Model Marketplace</h1>
      <p>Connected Account: {account || "Not connected"}</p>

      <ListModel account={account} />

      <ViewModels account={account} />

      <WithdrawFunds account={account} />
    </div>
  );
}
