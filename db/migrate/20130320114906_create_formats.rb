class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :category

      t.timestamps
    end
  end
end
