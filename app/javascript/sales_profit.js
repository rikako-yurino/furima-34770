window.addEventListener('load', ()=>{
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", ()=> {
    const inputValue = priceInput.value;
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(inputValue * 0.9);
  });
});