*** Settings ***

*** Variables ***
# Element locators

# Registration
${mainPageUrl} =  http://tutorialsninja.com/demo/
${myAccountTab} =  //a[@title="My Account"]
${registration} =  //a[contains(text(),'Register')]

${firstNameField} =  //input[@id="input-firstname"]
${lastNameField} =  //input[@id="input-lastname"]
${emailField} =  //input[@id="input-email"]
${phoneNumberField} =  //input[@id="input-telephone"]
${passwordField} =  //input[@id="input-password"]
${passwordConfirmField} =  //input[@id="input-confirm"]

${policyCheckbox} =  //input[@name="agree"]
${ContinueBtn} =  //input[@value="Continue"]

${ContinueBtnSucceed} =  //div[@class="pull-right"]/a