class AddCommunityLearningCenter < ActiveRecord::Migration[5.0]
  def change
    create_table :community_learning_centers do |t|
      t.string :school_name, null: false
      t.string :address, null: false
      t.string :gym_1, null: true
      t.string :gym_2, null: true
      t.string :gym_3, null: true
      t.string :auditorium, null: true
      t.string :cafeteria, null: true
      t.string :lrc, null: true
      t.string :music, null: true
      t.string :art, null: true
      t.string :classroom, null: true
      t.timestamps
    end
  end
end
