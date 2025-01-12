import React, { useState } from "react";
import contract from "../utils/contract.js";
import web3 from "../utils/web3.js";

function ListModel({ account }) {
  const [name, setName] = useState("");
  const [description, setDescription] = useState("");
  const [price, setPrice] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await contract.methods.listModel(name, description, web3.utils.toWei(price, "ether"))
        .send({ from: account });
      alert("Model listed successfully!");
    } catch (error) {
      alert("Error listing model.");
      console.error(error);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>List a New AI Model</h2>
      <input
        type="text"
        placeholder="Model Name"
        value={name}
        onChange={(e) => setName(e.target.value)}
        required
      />
      <textarea
        placeholder="Description"
        value={description}
        onChange={(e) => setDescription(e.target.value)}
        required
      ></textarea>
      <input
        type="number"
        placeholder="Price (ETH)"
        value={price}
        onChange={(e) => setPrice(e.target.value)}
        required
      />
      <button type="submit">List Model</button>
    </form>
  );
}

export default ListModel;
