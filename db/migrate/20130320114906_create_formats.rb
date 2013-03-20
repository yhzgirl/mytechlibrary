class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :type

      t.timestamps
    end
  end
end
