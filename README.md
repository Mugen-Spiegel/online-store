# README

This application is built for skill assesment purpose only

### Local set-up

run in terminal 
```

Bundle install                              # install dependency
rails db:create                             # create schema
rails generate solidus:install          # When you run the solidus:install generator without arguments, it runs migrations, adds sample data, and seeds your database:
rails g solidus_stripe:install
```


### Test Transaction for payment using BOGUS GATEWAY:


Name on card: `Enter Bogus Gateway`

Credit card number: any number

Enter each of these in turn to simulate different types of transaction:
    - Enter 1 to simulate a successful transaction
    - Enter 2 to simulate a failed transaction
    - Enter 3 to simulate an Exception (this generates a message indicating that an error has occurred with the provider.)

CVV: `Enter any 3-digit number (for example, 111.)`

Expiry Date: `Enter any date in the future.`

https://help.shopify.com/en/manual/checkout-settings/test-orders

###Test Transaction for payment using STRIPE 


Name on card: `Any random string`
Credit card number: `4242424242424242`
CVV: `Any 3 digits`
Expiry Date: `Any future date`

https://stripe.com/docs/testing
