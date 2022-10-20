class Hipster < ActiveRecord::Base
    has_many :jobs
    has_many :companies, through: :jobs

    def unique_companies
        self.companies.uniq.count
    end
end