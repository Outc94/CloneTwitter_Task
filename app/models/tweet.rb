class Tweet < ApplicationRecord
  validates_length_of :content, :within =>1..140 #You cannot enter more than 140 characters
end
