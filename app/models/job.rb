class Job < ActiveRecord::Base
    belongs_to :hipster
    belongs_to :company

    def to_json
        {a:1}.to_json
    end
end