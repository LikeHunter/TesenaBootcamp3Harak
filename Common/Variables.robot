*** Settings ***

*** Variables ***
# Element locators

# Registration  / login
${mainPageUrl} =  http://tutorialsninja.com/demo/
${myAccountTab} =  //a[@title="My Account"]
${registration} =  //a[contains(text(),'Register')]
${login} =  //a[contains(text(),'Login')]
${loginBtn} =  //input[@value="Login"]

${firstNameField} =  //input[@id="input-firstname"]
${lastNameField} =  //input[@id="input-lastname"]
${emailField} =  //input[@id="input-email"]
${phoneNumberField} =  //input[@id="input-telephone"]
${passwordField} =  //input[@id="input-password"]
${passwordConfirmField} =  //input[@id="input-confirm"]

${policyCheckbox} =  //input[@name="agree"]
${ContinueBtn} =  //input[@value="Continue"]

${ContinueBtnSucceed} =  //div[@class="pull-right"]/a

# Search
${searchBarField} =  //input[@name="search"]
${SearchBtn} =  //button[@type="button"]//i[@class="fa fa-search"]
${SearchedItem} =  //div[@class="product-thumb"]//h4/a
${SearchConfirmText} =  //div[@id="content"]//h2
${SearchMessage} =  //div[@id="content"]//p[2]

# Cart
${cartTotal} =  //span[@id="cart-total"]
${addToCart} =  //div[@id="content"]//button/i[@class="fa fa-shopping-cart"]
${viewCart} =  //strong//i[@class="fa fa-shopping-cart"]
${itemInCart} =  //div[@id="content"]//td[@class="text-left"]//a
${cartRemoveBtn} =  //button[@data-original-title="Remove"]