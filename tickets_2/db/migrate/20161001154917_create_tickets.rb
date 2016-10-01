class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.string :description
      t.integer :customer_id
      t.integer :agent_id
      t.integer :status

      t.timestamps
    end
  end
end
