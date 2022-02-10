class AddEnterpriseIdToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :enterprise_id, :integer
  end
end
