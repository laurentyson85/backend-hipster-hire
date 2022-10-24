class Hipster < ActiveRecord::Base
    has_many :jobs
    has_many :companies, through: :jobs

    def self.alpha_order
        order(:name)
    end

    def my_companies
        employers = companies.uniq.count

        if employers == 0 
            "I'm an unemployed hipster."
        elsif employers == 1
            "I work for #{employers} company. Rad 🤘 "
        else  employers > 1
            "I work for #{employers} companies. Rad 🤘 "
        end
    end

end

# TO DO: add my_companies to controller in to_json