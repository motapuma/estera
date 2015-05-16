class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.integer :company_id
    end
  end
end
