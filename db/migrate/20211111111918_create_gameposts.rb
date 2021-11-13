class CreateGameposts < ActiveRecord::Migration[6.1]
  def change
    create_table :gameposts do |t|
      t.string :title
      t.string :developer
      t.string :distributor
      t.string :platform
      t.string :releasedate
      t.string :playdate
      t.string :registrationdate
      t.string :updatedate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
