class Hipster < ActiveRecord::Base
    has_many :jobs
    has_many :companies, through: :jobs

    def self.alpha_order
        order(:name)
    end

end