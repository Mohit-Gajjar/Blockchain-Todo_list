module.exports = {
  networks: {
    development: {
      host: "192.168.43.59",
      port: 7545,
      network_id: "5777",
    },
    advanced: {
      websockets: true, 
    },
  },
  contracts_build_directory: "./src/abis/",
  compilers: {
    solc: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};