class User < ApplicationRecord
    has_many :job_postings
    has_many :applications
  end