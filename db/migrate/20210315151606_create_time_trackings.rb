class CreateTimeTrackings < ActiveRecord::Migration[6.1]
  def change
    create_table :time_trackings do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_at, null: false
      t.datetime :end_at

      t.timestamps
    end
  end
end
