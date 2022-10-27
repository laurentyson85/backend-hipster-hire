class Job < ActiveRecord::Base
    belongs_to :hipster

    def self.alpha_order
        order(:title)
    end
end