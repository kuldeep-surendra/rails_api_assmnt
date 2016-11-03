class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.float :rating
      t.string :language
      t.string :actors
      t.string :director
      t.string :producer

      t.timestamps null: false
    end
  end
end
