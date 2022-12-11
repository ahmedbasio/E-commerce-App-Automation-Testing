package stepDefs;

import io.cucumber.java.en.And;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.testng.Assert;
import pages.homePage;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;


import java.util.List;

public class currenciesFeatureSteps {
    homePage home_page;


    @When("user press on currencies")
    public void userPressCurrencies() throws InterruptedException {
        home_page.selectCurrency().click();
        Thread.sleep(1000);

    }
    @And("^user chooses \"(.*)\"$")
    public void userChooseEuro(String currency)  {
        Select select= new Select(home_page.selectCurrency());
        if((currency.equals("euro"))||(currency.equals("Euro"))){
            select.selectByVisibleText("Euro");
        }
        else {
            select.selectByVisibleText("US Dollar");
        }

    }
    @Then("^the product currency changes to \"(.*)\"$")
    public void checkOnCurrency(String currency){
        List <WebElement> prices = home_page.getActualPrice();
        if((currency.equals("euro"))||(currency.equals("Euro"))){
            String expectedCurrency="€";
            for(int x=0; x<4 ; x++){
                Assert.assertTrue(prices.get(x).getText().contains(expectedCurrency));
            }
        }
        else {
            String expectedCurrency="$";
            for(int x=0; x<4 ; x++){
                Assert.assertTrue(prices.get(x).getText().contains(expectedCurrency));
            }
        }

    }

    @Given("initialize Currencies feature")
    public void setHome_page(){
        home_page = new homePage(Hooks.driver);
    }

}
