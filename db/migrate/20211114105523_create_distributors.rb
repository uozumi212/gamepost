class CreateDistributors < ActiveRecord::Migration[6.1]
  def change
    create_table :distributors do |t|
      t.string :content

      t.timestamps
    end
  end
end
