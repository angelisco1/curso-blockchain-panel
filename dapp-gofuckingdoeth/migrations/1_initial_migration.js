const GoFuckingDoEth = artifacts.require("GoFuckingDoEth");

module.exports = function (deployer) {
  deployer.deploy(GoFuckingDoEth, 5000);
};
