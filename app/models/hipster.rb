class Hipster < ActiveRecord::Base
    has_many :jobs
    has_many :companies, through: :jobs
end