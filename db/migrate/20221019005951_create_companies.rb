class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :industry
      t.string :slogan
      t.string :logo_url
    end
  end
end
