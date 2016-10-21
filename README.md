# README

References and tools
--------------------
- Rails
  - [Default toturial of Rails](http://guides.rubyonrails.org/getting_started.html)

- Attachment feature
  - [carrierwave](https://github.com/carrierwaveuploader/carrierwave)

- Searching feature
  - [ransack](https://github.com/activerecord-hackery/ransack)

- Testing
  - [rails tutorial](http://guides.rubyonrails.org/testing.html)
  - [Rspec](https://github.com/rspec/rspec-rails)
    - [How to test rails models](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec)
  - [shoulda]
    - [error `expected ... to repsond to 'has_one'`](https://github.com/thoughtbot/shoulda-matchers/issues/785)
      - [add configuration setup by append lines below to the `spec/rails_helper.rb`](https://github.com/thoughtbot/shoulda-matchers#configuration)
	~~~~
	Shoulda::Matchers.configure do |config|
	  config.integrate do |with|
	    # Choose a test framework:
	    with.test_framework :rspec
	    with.test_framework :minitest
	    with.test_framework :minitest_4
	    with.test_framework :test_unit

	    # Choose one or more libraries:
	    with.library :active_record
	    with.library :active_model
	    with.library :action_controller
	    # Or, choose the following (which implies all of the above):
	    with.library :rails
	  end
	end
	~~~~
