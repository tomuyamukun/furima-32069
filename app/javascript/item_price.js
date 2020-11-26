window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     let inputValue = priceInput.value;
     let addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(inputValue / 10);
     let addProfit = document.getElementById("profit");
      addProfit.innerHTML = Math.floor(inputValue * 0.9);
   })
});