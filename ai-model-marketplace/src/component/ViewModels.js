import React, { useEffect, useState } from "react";
import contract from "../utils/contract.js";
import web3 from "../utils/web3.js";

function ViewModels({ account }) {
  const [models, setModels] = useState([]);

  useEffect(() => {
    async function fetchModels() {
      try {
        const modelCount = await contract.methods.getModelCount().call();
        const models = [];
        for (let i = 0; i < modelCount; i++) {
          const model = await contract.methods.getModelDetails(i).call();
          models.push({ id: i, ...model });
        }
        setModels(models);
      } catch (error) {
        console.error("Error fetching models", error);
      }
    }
    fetchModels();
  }, []);

  const purchaseModel = async (id, price) => {
    try {
      await contract.methods.purchaseModel(id).send({
        from: account,
        value: price,
      });
      alert("Model purchased successfully!");
    } catch (error) {
      alert("Error purchasing model.");
      console.error(error);
    }
  };

  return (
    <div>
      <h2>Available AI Models</h2>
      {models.map((model, index) => (
        <div key={index}>
          <h3>{model.name}</h3>
          <p>{model.description}</p>
          <p>Price: {web3.utils.fromWei(model.price, "ether")} ETH</p>
          <button onClick={() => purchaseModel(model.id, model.price)}>
            Purchase
          </button>
        </div>
      ))}
    </div>
  );
}

export default ViewModels;
