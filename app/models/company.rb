class Company < ActiveRecord::Base
    has_many :jobs
    has_many :hipsters, through: :jobs

    def hired_hipsters
      employees = hipsters.uniq.count

        if employees == 0 
          "No hipsters yet! We're hiring."
        elsif employees == 1
          "Our company employs #{employees} hipster."
        else  employees > 1
          "Our company employs #{employees} hipsters."
      end
    end

  end

  # TO DO: add hired_hipsters to controller in to_json