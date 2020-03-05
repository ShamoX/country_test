class AddInhabitantsToCountry < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :inhabitants, :integer
  end
end
