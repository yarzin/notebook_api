class CreateReadmes < ActiveRecord::Migration[5.0]
  def change
    create_table :readmes do |t|
      t.string :text

      t.timestamps
    end
  end
end