class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :mana_cost
      t.string :img_url
      t.string :spell_type
      t.string :description

      t.timestamps
    end
  end
end
