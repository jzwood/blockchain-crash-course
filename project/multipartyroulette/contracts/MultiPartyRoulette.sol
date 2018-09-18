pragma solidity ^0.4.19;

contract MultiPartyRoulette {
  event AwaitingBets(address creator, uint16 tableNumber, uint256 betAmount);
  event BetPlaced(address participant, uint16 tableNumber, bool red);
  event betsClosed(uint16 tableNumber);
  event Results(address participant, uint16 tableNumber, bool won);
  event TableClosed(uint16 tableNumber);

  string constant win =  "You win!";

  address private House;

  RouletteWheel[] tables;

  enum WheelState {SPINNING, STOPPED, CLOSED}

  struct RouletteWheel {
    address croupier;
    bytes32 hashedOutcome;
    uint256 betAmount;
    WheelState wheelState;
    HighRollers highrollers;
  }

  struct HighRollers {
    address[] ids;
    bool[] redBets;
  }

  constructor() public {
    House = msg.sender;
  }

  function spinWheel(uint8 numOfPlayers, bytes32 hashedOutcome, uint256 betAmount) external {
    address croupier = msg.sender;
    /*
     * @todo
     * require ante to be > 0
     */
    require(numOfPlayers > 0 && numOfPlayers < 7);
    RouletteWheel memory table = RouletteWheel(croupier, hashedOutcome, betAmount, WheelState.SPINNING, HighRollers(new address[](numOfPlayers), new bool[](numOfPlayers)));
    uint16 tableNumber = uint16(tables.length);
    tables.push(table);
    emit AwaitingBets(croupier, tableNumber, betAmount);
  }

  function tableExists(uint16 tableNumber) view private returns(bool exists) {
    exists = (tableNumber >= 0 && tableNumber < tables.length);
  }

  /*
   * You can only bet red or black. true -> red, false -> black
   */
  function placeBet(uint16 tableNumber, bool red) external payable {
    require(tableExists(tableNumber));
    RouletteWheel storage table = tables[tableNumber];
    uint256 betAmount = msg.value;
    /*
     * @todo
     * 1. make sure sender hasn't already called PlaceBet
     * 2. make sure the croupier doesn't call PlaceBet
     */
    require(betAmount == table.betAmount && table.wheelState == WheelState.SPINNING);
    table.highrollers.ids.push(msg.sender);
    table.highrollers.redBets.push(red);
    emit BetPlaced(msg.sender, tableNumber, red);

    address[] memory ids = table.highrollers.ids;
    if(ids[ids.length - 1] == address(0)) {
      table.wheelState = WheelState.STOPPED;
      emit betsClosed(tableNumber);
    }
  }

  function getIntegerFraction(uint256 numerator, uint8 denominator) private pure returns(uint256) {
    return (numerator - (numerator % denominator)) / denominator;
  }

  function cashOut(uint16 tableNumber, bool red, bytes32 salt) external {
    require(tableExists(tableNumber));
    bytes32 hashedOutcome = keccak256(
     abi.encodePacked(red ? 'red' : 'black', salt)
    );

    RouletteWheel storage table = tables[tableNumber];
    require(table.hashedOutcome == hashedOutcome);

    HighRollers memory players = table.highrollers;

    uint8 winners = 0;
    for(uint8 i=0; i < players.ids.length; i++) {
      winners += (players.redBets[i] == red) ? 1 : 0;
    }

    uint256 pot = players.ids.length * table.betAmount;

    if(winners == 0) {
      House.transfer(getIntegerFraction(pot, 2) + pot % 2);
      table.croupier.transfer(getIntegerFraction(pot, 2));
      emit Results(table.croupier, tableNumber, true);
    } else {
      emit Results(table.croupier, tableNumber, false);

      uint256 portion = getIntegerFraction(pot, winners);
      for(uint8 j=0; j < players.ids.length; j++) {
        bool won = (players.redBets[j] == red);
        if (won) {
          players.ids[j].transfer(portion);
        }
        emit Results(players.ids[j], tableNumber, won);
      }

      House.transfer(pot % winners); // this will usually be in the range of 1 or 2 wei = 0.000000000000000001 USD
      table.wheelState = WheelState.CLOSED;

      emit TableClosed(tableNumber);
    }

  }
}
