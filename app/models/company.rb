class Company < ActiveRecord::Base
    has_many :jobs
    has_many :hipsters, through: :jobs

    def hired_hipsters
      employees = hipsters.uniq
      "Our company employs #{employees.count} hipsters." 
    end
  end