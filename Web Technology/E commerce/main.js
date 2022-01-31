const submitButton = document.getElementById("submitButton");
var totalPrice = 0;
var imgURL = '';
function loadImg(event){
    imgURL =  URL.createObjectURL(event.target.files[0]);
}
submitButton.addEventListener('click', function () {
    const productName = document.getElementById("productName");
    const productImage = document.getElementById("productImage");
    const productDescription = document.getElementById("productDescription");
    // const productQuantity = document.getElementById("productQuantity");
    const productPrice = document.getElementById("productPrice");
    const listItems = document.getElementById("listItems");
    const liName = document.createElement("li");
    var img = document.createElement("img");
    img.style.width = "50px";
    img.style.height = "50px";
    img.src = imgURL;
    listItems.appendChild(img);
    liName.innerHTML = "<span style='font-weight:bolder;font-size:20px;'>"+productName.value+"</span><br>"+productDescription.value+"<br>Price - "+productPrice.value+"Rs. <br>";
    listItems.appendChild(liName);
    const buyButton = document.createElement("button");
    buyButton.innerHTML = "BUY";
    buyButton.classList.add("btn", "btn-primary");
    listItems.appendChild(buyButton);
    const blankSpace = document.createElement("span");
    blankSpace.innerHTML = "<br><br>";
    listItems.appendChild(blankSpace);
    const fPrice = productPrice.value;
    const fNamePrice = productName.value + "  -  " + productPrice.value +"Rs.   "
    productPrice.value = '';
    productName.value = '';
    productDescription.value = '';
    buyButton.onclick = function(){
        totalPrice = parseInt(fPrice) + totalPrice ;
        document.getElementById("totalPrice").innerText = totalPrice;
        const cartLiName = document.createElement("li");
        cartLiName.innerHTML = fNamePrice
        var removeButton = document.createElement("button");
        removeButton.innerHTML = "REMOVE";
        removeButton.classList.add("btn", "btn-primary");
        const blankSpace = document.createElement("span");
        blankSpace.innerHTML = "<br><br>";
        cartLiName.appendChild(removeButton);
        cartLiName.appendChild(blankSpace);
        const cartListItems = document.getElementById("cartListItems");
        cartListItems.appendChild(cartLiName);
        removeButton.onclick = function() {
            totalPrice = totalPrice - parseInt(fPrice);
            document.getElementById("totalPrice").innerText = totalPrice;
            cartListItems.removeChild(cartLiName);
        }
    }
});