// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

/* Purchase agreement contract where buyer and seller has to pay a deposit. 
Upon confirming that the good is recieved, the deposit is returned. The seller 
is then paid.
*/

contract PurchaseAgreement {

    uint256 public itemPrice;
    address payable public seller;
    address payable public buyer;

    enum State { Created, Locked, Released, Inactive}

    State public state;

    constructor() payable {
        seller = payable(msg.sender);
        itemPrice = msg.value / 2;
    }
    /// The function cannot be called at the current state.
    error InvalidState();
    /// Only the buyer can call this function.
    error OnlyBuyer();
    /// Only the seller can call this function.
    error OnlySeller();

    modifier inState(State state_) {
        if(state != state_) {
            revert InvalidState();
        }
        _;
    }

    modifier onlyBuyer() {
        if (msg.sender != buyer) {
            revert OnlyBuyer();
        }
        _;
    }

    modifier onlySeller() {
        if (msg.sender != seller) {
            revert OnlySeller();
        }
        _;
    }

    function confirmPurchase() external inState(State.Created) payable {
        require(msg.value == (2 * itemPrice), "please send 2x the purchase amount");
        buyer = payable(msg.sender);
        state = State.Locked;
    }

    function confirmRecieved() onlyBuyer external inState(State.Locked) {
        state = State.Released;
        buyer.transfer(itemPrice);

    }

    function paySeller() external onlySeller inState(State.Released) {
        state = State.Inactive;
        seller.transfer(3 * itemPrice);
    }

    function abort() external onlySeller inState(State.Created) {
        state = State.Inactive;
        seller.transfer(address(this).balance);
    }
    
}