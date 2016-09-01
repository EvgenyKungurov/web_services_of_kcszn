class CreateEmploymentCenters < ActiveRecord::Migration[5.0]
  def change
    create_table :employment_centers do |t|

      t.timestamps
    end
  end
end
