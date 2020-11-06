
window.addEventListener('load', () => {

  const priceInput   = document.getElementById("item-price");
  const sale_fee     = document.getElementById("add-tax-price");
  
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    
    // 販売手数料の計算
    function sale_fee_calc(){
      const sale_fee = inputValue /10 ;
      const sale_fee_includes_tax = sale_fee / 10 ;
      return sale_fee + sale_fee_includes_tax ;
    }

    // 販売手数料の表示
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${Math.floor(sale_fee_calc())}`

    // 販売利益の表示
    const profit  = document.getElementById("profit");
    const profit_calc =   inputValue - `${Math.floor(sale_fee_calc())}`
    profit.innerHTML = `${Math.floor(profit_calc)}`
  })
});