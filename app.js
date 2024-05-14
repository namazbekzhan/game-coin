import {abi, contractAddress} from './contracts.js';  // Assuming you export these from another JS file

let contract;
let userAccount;

async function loadWeb3() {
    if (window.ethereum) {
        window.web3 = new Web3(window.ethereum);
        await window.ethereum.enable();
        contract = new web3.eth.Contract(abi, contractAddress);
        const accounts = await web3.eth.getAccounts();
        userAccount = accounts[0];
    } else {
        console.log('Ethereum wallet not found. Install MetaMask.');
    }
}

async function registerUser() {
    const username = document.getElementById('username').value;
    const email = document.getElementById('email').value;
    const bio = document.getElementById('bio').value;
    await contract.methods.registerUser(username, email, bio).send({from: userAccount});
}

async function getUserInfo() {
    const address = document.getElementById('userInfoAddress').value;
    const result = await contract.methods.getUserInfo(address).call();
    document.getElementById('userInfoDisplay').innerText = `Username: ${result[0]}, Email: ${result[1]}, Bio: ${result[2]}`;
}

async function buyTokens() {
    const amount = document.getElementById('buyAmount').value;
    const requiredETH = amount * (await contract.methods.sellRate().call()) / 10 ** 18; // Convert based on token decimals
    await contract.methods.buy(amount).send({
        from: userAccount,
        value: web3.utils.toWei(requiredETH.toString(), 'ether')
    });
}

async function sellTokens() {
    const amount = document.getElementById('sellAmount').value;
    await contract.methods.sell(amount).send({from: userAccount});
}

async function transferTokens() {
    const to = document.getElementById('transferTo').value;
    const amount = document.getElementById('transferAmount').value;
    await contract.methods.send(to, amount).send({from: userAccount});
}

async function sendToOwner() {
    const totalSupply = await contract.methods.totalSupply().call();
    await contract.methods.sendToOwner(totalSupply).send({from: userAccount});
}

async function setRates() {
    const sellRate = document.getElementById('newSellRate').value;
    const buyRate = document.getElementById('newBuyRate').value;
    await contract.methods.setRates(sellRate, buyRate).send({from: userAccount});
}

window.addEventListener('load', loadWeb3);
