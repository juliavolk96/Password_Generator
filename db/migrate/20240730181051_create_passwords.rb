class CreatePasswords < ActiveRecord::Migration[7.1]
  def change
    create_table :passwords do |t|
      t.string :content
      t.integer :length
      t.string :case_option
      t.boolean :add_non_letter
      t.integer :non_letter_count

      t.timestamps
    end
  end
end
