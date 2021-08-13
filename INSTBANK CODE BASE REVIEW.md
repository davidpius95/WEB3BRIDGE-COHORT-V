INSTBANK CODE BASE REVIEW
https://github.com/Instadapp/InstaContract/blob/master/contracts/v2/InstaBank.sol

COMPILER VERSION = 0.5.0

SAFEMATH: safemath is a solidity library which Wrappers over Solidity’s arithmetic operations with added overflow and underflow checks.
	-mul: this is multiplication function in safemath
	-div: this is division function in safemath
	-uint256: this is a data type which have size of 256 in solidity


Interface IERC20: This is an interface of IERC20 which contain only function without logic of contract ERC20.sol 

	-balanceOf: this function receive one argument of an address, it declear external and view i.e you can only callthis function outside this contract and you can only view this function, returns an address

	-transfer:this function receive two argument of address and uint, it can only be called outside the contract and it can only view cant write to it , returns an address

	-approve: this function receive two argument of address and uint, it can only be called outside the contract and it can only view can not  write to it , returns a boolean


	-transferFrom: this function receive three argument of address, address and uint, it can only be called outside the contract and it can only view cant write to it , returns an address

Interface AddressRegistry: this is an interface contract which contain only function 
	-getAddr: this function receive an argument of string which and return an address
Interface MakerCDP:this is an interface contract that contains functions of another contract without it logics
	-open:this function can be only be call outside the contract and it returns a bytes32 value
	-join:this function receive an argument of uint

	-exit:this function receive an argument of uint can only be call outside the contract 

	-give:this function receive an argument of bytes32 and an address 

	-lock: function receive an argument of bytes32 and an uint

	-free: function receive an argument of bytes32 and a uint

	-draw: function receive an argument of bytes32 and a uint

	-wipe: function receive an argument of bytes32 and a uint

	-shut: function receive an argument of bytes32 and a uint

	-per:this function can only be called outside the contract and can only be view it returns a uint value
    
	lad:this function receive an argument of bytes32 returns an address
Interface Resolver: this an interface contract which holds only function without logic in the function 
	-ClaimCDP:this function get an argument of uint and can only be called outside the contract 
	-transferCDPInternal:this  function receive an argument of uint and address 
 
	-initAct:this function receive an argument of uint  and is payable 
Interface PriceInterface:this an interface contract which only contain  function without a logic 
	-peek: this function return bytes32 and bool data type and it view
Interface WETHFace:this an interface contract which only hold functions of another contract

	-balanceOf: this function is payable and can only be called outside the contract 

	-deposit:this  function is payable and can only be called outside the contract

	Withdraw: this function receive an argument of unit and can only be called outside the function

Interface Instakyber this is an interface which which contain only function without logic of another contract
	-executeTrade:this function receive 5 argument the function is payable it call only outside the contract , returns uint

	-getExpectedPrice this function 3 argument can only be called outside the contract and it can only be read not written on, it return 2 uint 

Registry:this is a contract which contain the body of the smart contract
	addressRegistry:this is a state  variable 

	-onlyownerthis is a modifier function which change the behavior of a function and this function make sure that  the admin as caller of the function  

	-getaddress: this function receive string argument can only be called outside the contract which is only view , it returns an address . it also create an instance of a interface 

GlobalVar is Registry: this is a contract that is inheriting from Registry
    	-using SafeMath for uint: this is a way to attach a safemath which is use for calculation to a uint data type 

    using SafeMath for uint: this is use to make every uint256 data type not having an overflow or underflow

	-cdpAddr: declaring this variable as an address
	-cdps: declaring a mapping which is uint as key and address as value naming it cdps
	-resolvers: this is a  mapping name resolvers  which map key of address to a Boolean value
	-Freezed: this a variable name of a Boolean 
	-isFreezed: this is a modifier which change the behaviour of function, this modifier is making sure that is not freezed is true and if it false it will throw a message and the _; it join the function with the modifer
	-isCupOwner: this is a modifier which change the behaviour of function, this modifier is comparing value to be equal to each other and if any of them are equal this will be  true and if it false it will throw a message and the _; it join the function with the modifer
	-pethPEReth: this function received a uint argument returns a uint and is making an instance of of an interface naming it loanMaster passing an argument of cdpAddr

BorrowLoan is GlobalVar: this contract is borrowloan is inheariting from contract globalvar, this means all the properties or function of globalvar, borrowloan has it
	
	lockedETH: this an event that send data to the front end this event is sending the 4 argument  
	-loanedDAI: this an event that send data to the front end this event is sending the 4 argument  
	- NewCDP: this an event that send data to the front end this event is sending the 2 argument  
	
	Borrow: this function receive three argument , it payable function and has a modifiers, it require that not freezed is true and it create an instance of MakerCDP 
It creating a new CDP  also locking ETH, miting DAI

Repay is BorrowLoan: 
	WipedDAI: this an event that send data to the front end this event is sending the 4 argument  

	-FreedETH: this an event that send data to the front end this event is sending the 3 argument  

	-ShutCDP: this an event that send data to the front end this event is sending the 4 argument  

	WipeDAI: this function received two argument and it can receive ether it also get a name and pass it to an address, making instance of an IERC20 token, it making instance of MakerCDP
contractMKR: contract MKR balance before wiping
daiTkn: it get DAI to pay debt
loanMaster: wipe DAI
mkrCharged: MKR fee = before wiping bal -after wiping balance
if: interactingwith Uniswap to swap ETH with MKR
else: take MKR directly from address
emit :this is a trigger that trig the event function 

unloackETH: this function  send pethfree from frontend instead of ethFree ist has require that check is not freezed , creating the instance of MakerCDP

shut: this function receive two argument set to isfreezed an if statement to check 

MiscTask: this is inherinting from repayloan 
		transferInternal: this event when trigger it receive 3 argument

	Transferexternal: this event when trigger it receive 3 argument
	CDPClaimed : this event when trigger it receive 2 argument
	ResolverOneway: this event when trigger it receive 3 argument
	ResolverTwoWay: this event when trigger it receive 3 argument
TransferCDPInternal: this function receive some argument, having a check that make sure that nextOwner is not address 0 it also mapp nextowner to cdpNum then trigger an event 
transferCDPExternal: this function receive 2 argument which confirm that it freezed and also next owner not address 0, it creating an instance of MakerCDP called loanMaster where it use the function give and mapp address 0 to cdpNum then trigger transExternal 

changeResolverOneWay: transferring CDP to resolver contract, it has two argument creating an instance of Resolver using two functions create another instance of MakerCDP using the give function then trigger an event ResolverOneWay

changeResolverTwoWay: transferring CDP to resolver contract, it has two argument creating an instance of Resolver using two functions create another instance of MakerCDP using the give function then trigger an event ResolverOneWay

getETHRate: this function accept an argument which return uint it create an instance of PriceInterface and uses the instance to access peek and then return a  value

getCDP : this function takes an arg return 2 value 
approveERC20: this function receive 1 arg returns a n address and bytes  then return cdps and bytes 
approveERC20: this function create an instance of ERC20 and it approving the address and amount passed 
INSTABANK Is Msctask: this contract interact or inherites the properties in contract MiscTask
	MKRCollected: this gives data to the frontend with uint
	
	Contstructor: this constructor accept one arg of address and it assign it to addressRegistry then it uses the getAddress function to get cdp and pass it to cdpAddr and then call the approveERC20
	
	Function: this is a fall back function which receive ether and it executed when there is no exit for a function
	
	Freeze: this function get a bool arg which is onlyadmin i.e only an admin can call this function and it then assign the bool value to freezed

	manageResolver: this function receive two arg and can only be called by an admin then it mapps resolvers address to isAllowed Boolean 

	collecrMKR: this function accept an arg only admin can call this function then it create an instance token of ERC20 name mkrTkn, then it perform a token transfer then trigger the event MKRCollected  



 




