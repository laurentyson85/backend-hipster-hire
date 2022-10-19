class Job < ActiveRecord::Base
    belongs_to :hipster
    belongs_to :company
  end