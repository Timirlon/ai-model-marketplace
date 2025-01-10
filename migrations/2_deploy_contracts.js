const AIModelMarketplace = artifacts.require("AIModelMarketplace");

module.exports = function (deployer) {
    deployer.deploy(AIModelMarketplace);
};
