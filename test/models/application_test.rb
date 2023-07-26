require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  test "should create application for a user and job posting" do
    user = User.create(name: "John Doe", email: "john@example.com")
    job_posting = JobPosting.create(title: "Software Engineer", description: "Join our awesome team!", user: user)

    application = Application.new(user: user, job_posting: job_posting, message: "I'm interested!")

    assert application.save
  end

  test "should not create application without a user" do
    job_posting = JobPosting.create(title: "Software Engineer", description: "Join our awesome team!")
    application = Application.new(job_posting: job_posting, message: "I'm interested!")

    assert_not application.save
  end

  test "should not create application without a job posting" do
    user = User.create(name: "John Doe", email: "john@example.com")
    application = Application.new(user: user, message: "I'm interested!")

    assert_not application.save
  end
end

