import hello from 'ic:canisters/hello';

hello.greet(window.prompt("Enter your name:")).then(greeting => {
  window.alert(greeting);
});
