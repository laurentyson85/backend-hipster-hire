class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :position
      t.string :field
      t.string :key_skill
      t.string :employment
      t.boolean :open
      t.boolean :expired
      t.integer :hipster_id
      t.integer :company_id
  end
end
