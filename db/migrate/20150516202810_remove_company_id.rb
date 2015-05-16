class RemoveCompanyId < ActiveRecord::Migration
  def change
  	remove_column :services ,:company_id
  	add_column    :services ,:name,  :string
  	add_column    :services ,:phone, :integer
  	add_column    :services ,:email, :string
  	add_column    :services ,:type,  :integer

  	create_table :urls do |t|
      t.integer :service_id
      t.integer :url
    end

  end
end
