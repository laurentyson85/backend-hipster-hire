class Company < ActiveRecord::Base
    has_many :jobs
    has_many :hipsters, through: :jobs
end