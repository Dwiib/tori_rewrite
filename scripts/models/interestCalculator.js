var ethers = require('ethers');
var BigNumber = ethers.BigNumber;
//change these:
var rateNumerator = 102;
var rateDenominator = 100;
//

var exp = BigNumber.from("2");
var oneYear = BigNumber.from("25");

//the period is about 2m seconds (23d) above the year
var left = BigNumber.from("0");
var right = 1000;
var trial = oneEthInWei;
var expected = oneEthInWei.mul(rateNumerator).div(rateDenominator);
var two = BigNumber.from("2");
console.log("start");
while(!left.eq(right)) {
    console.log("loop")
    var middle = (left.add(right)).div(two);
    //this line is wrong
    var x = trial.mul(exp.pow(oneYear.mul(middle)));
    if(x.gt(expected)) {
        console.log("gt");
        right = middle.sub(BigNumber.from(1));
    } else {
        console.log("le");
        left = middle;
    }
    console.log("left, ", left);
    console.log("right, ", right);
    console.log("difference, ", right.sub(left));
    global.gc();
}