class CreateHipsters < ActiveRecord::Migration[6.1]
  def change
    create_table :hipsters do |t|
      t.string :name
      t.string :bio
    end
  end
end
