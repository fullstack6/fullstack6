# README

* Ruby Version 2.7.0

* Rails Version 6.0.3

#### Instructions

* Clone repo
* Install the bundle as `bundle install`
* Start the rails server using `rails s`
* Visit `localhost:3000` on browser or hit `curl localhost:3000` on terminal
* Run the test cases `bundle exec rspec `

##### Description

* Connect with social media api to know the data it will get result by FB, twitter, Insta
* Handle error for various HTTP status code 
* Expected output from the takehome.io endpoint is a valid JSON for success case
* JSON response in the format: `{ twitter: [tweets], facebook: [statuses], instagram: [pictures] }`
* Provide test cases for controller and services