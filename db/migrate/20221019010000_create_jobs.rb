class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :position
      t.string :key_skill
      t.string :employment
      t.boolean :open
      t.boolean :expired
      t.string :company_name
      t.string :company_slogan
      t.string :company_logo_url
      t.integer :hipster_id
    end
  end
end
