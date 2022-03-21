//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
    
contract ETHswap {
    address public _owner;

    
    struct Transaction{
        uint256 amount;
        address reciever;
        uint256 exc_rate;
        bytes32 txn_hash;

    }

    mapping(bytes32 => Transaction) private transactions;


    constructor(){
        _owner = msg.sender;

    }
 

    modifier onlyOwner() {
        require(msg.sender == _owner,"Ownable: caller is not the owner");
        _;
    }
 
    function deposit() public payable  {
    payable(address(this)).transfer(msg.value);
    } 

    function getCurrentBalance() external view returns (uint256 ){
        return address(this).balance;
       
    }

    // This function is used to get ether from contract address in worse case.
    function withdraw(address payable _account, uint256 _amount) public onlyOwner returns (bool) {
        require(address(this).balance >= _amount, 'Not enough Ether in contract!');

        // uint256 balance = address(this).balance;

        payable(_account).transfer(_amount);
        return true;
    }

  
    
      
	receive() external payable {}
     
} 
    //  function withdraw(address payable _reciever , uint256 _amount, bytes32 txhash , uint ex_rate ) public onlyOwner{
    //     // if( transactions[txhash].txn_hash != 0 ){
    //         uint256 contractBalance= address(this).balance;
    //         contractBalance-=_amount;
    //         payable(_reciever).transfer(_amount);
    //         //transactions[txhash] 
    //         //   transactions[txhash] = Transaction( _amount, _reciever, ex_rate, txhash);
    //     }
    //     // else{
    //     // /
