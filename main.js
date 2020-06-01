console.log('hello');

arr = ['nice', 'hey']
console.log(arr);

obj = {x:1 ,y:'obj', z:3}
console.log(obj.y);


function factorial(n) {
  if (n != 0) {
    return n * factorial(n -1);
  }
  return 1
}
console.log(factorial(5));

function closure(init) {
  var counter = 0;
  return function() {
    return ++ counter
  }
}
var myClosure = closure(1)
console.log(myClosure());
console.log(myClosure());
console.log(myClosure());

const a = function(a,b) {
  return  a + b
}
console.log(a(1,2));

function add(a,b) {
  return a + b
}
console.log(add(2,4));

function add(a,b) {
  return a + b
}
const addFunc = add;
console.log(addFunc(2,3));

const myMax = Math.max
console.log(add(1,2), addFunc(4,2));
console.log(Math.max(1,2), myMax(1,2));

function doTwice(func) {
  func();
  func();
}
function hello() {
  console.log('hello');
}
doTwice(hello);

function doTwice(func) {
  func()
  func()
}
doTwice(function() {
  console.log('hello');
})