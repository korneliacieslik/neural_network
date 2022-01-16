class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.bigint :user_id
      t.integer :age
      t.integer :dalc
      t.integer :walc
      
      t.timestamps
    end
  end
end
