class Tweet < ApplicationRecord
  validates_length_of :content, :within =>1..140 
end
