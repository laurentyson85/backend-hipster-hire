class Job < ActiveRecord::Base
    belongs_to :hipster
    belongs_to :company

    def self.alpha_order
        order(:title)
    end
end